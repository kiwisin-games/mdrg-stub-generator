from __future__ import annotations

import ast
import json
import re
from collections import Counter
from dataclasses import dataclass, field
from pathlib import Path

from lua_usage_index import UsageAlias, UsageDoc, add_alias, lua_string_literal, unquote_lua_string


LUA_STRING_PATTERN = r"'(?:\\.|[^'\\])*'|\"(?:\\.|[^\"\\])*\""

INTERNAL_BROWSER_WEBSITE_IDS = {
    "adredirect.ic",
    "bang.ic",
    "bang.ic/email",
    "blackjack.casino.ic",
    "casino.ic",
    "casino.ic/tokens",
    "cockcockcockcockcock.ic",
    "cocktwitch.ic",
    "cocktwitch.ic/leaderboard",
    "cocktwitch.ic/stats",
    "cocktracts.ic",
    "cocktracts.ic/available",
    "cocktracts.ic/contract",
    "cocktracts.ic/help",
    "cocktracts.ic/history",
    "cocktracts.ic/partner",
    "cocktracts.ic/partners",
    "cocktracts.ic/partner?Id=666",
    "dickcheese.ic",
    "dickcheese.ic/1",
    "dickcheese.ic/2",
    "duck.ic",
    "fedup.ic",
    "hotanimebabes.ic",
    "iamacheater",
    "ladyparts.ic",
    "losefatquickly.ic",
    "patriciascookingblog.food/blog",
    "patriciascookingblog.food/login",
    "patriciascookingblog.food/main",
    "peepee.ic",
    "pixelglasses.ic",
    "realmenfishing.ic",
    "slots.casino.ic",
    "stonks.ic",
}


@dataclass(frozen=True)
class UnitySceneEntry:
    kind: str
    line: int
    text: str


@dataclass
class UnityUsageIndex:
    source_txt: str | None = None
    source_md: str | None = None
    script_entries: int = 0
    compare_entries: int = 0
    call_counts: Counter[str] = field(default_factory=Counter)
    field_counts: Counter[str] = field(default_factory=Counter)
    aliases: dict[str, UsageAlias] = field(default_factory=dict)
    class_docs: dict[str, UsageDoc] = field(default_factory=dict)
    method_docs: dict[tuple[str, str], UsageDoc] = field(default_factory=dict)
    field_docs: dict[tuple[str, str], UsageDoc] = field(default_factory=dict)
    method_param_type_overrides: dict[tuple[str, str, str], str] = field(default_factory=dict)
    field_type_overrides: dict[tuple[str, str], str] = field(default_factory=dict)
    raw_story_flags: Counter[str] = field(default_factory=Counter)
    raw_global_flags: Counter[str] = field(default_factory=Counter)

    def class_description(self, class_name: str) -> str | None:
        entry = self.class_docs.get(class_name)
        return entry.description if entry else None

    def method_description(self, class_name: str, method_name: str) -> str | None:
        entry = self.method_docs.get((class_name, method_name))
        return entry.description if entry else None

    def field_description(self, class_name: str, field_name: str) -> str | None:
        entry = self.field_docs.get((class_name, field_name))
        return entry.description if entry else None

    def method_param_type(self, class_name: str, method_name: str, param_name: str) -> str | None:
        return self.method_param_type_overrides.get((class_name, method_name, param_name))

    def field_type(self, class_name: str, field_name: str) -> str | None:
        return self.field_type_overrides.get((class_name, field_name))


def _counter_to_data(counter: Counter[str]) -> dict[str, int]:
    return {key: counter[key] for key in sorted(counter)}


def _counter_from_data(data: dict[str, int] | None) -> Counter[str]:
    return Counter(data or {})


def unity_usage_index_to_data(index: UnityUsageIndex) -> dict:
    return {
        "schema_version": 1,
        "source_txt": index.source_txt,
        "source_md": index.source_md,
        "script_entries": index.script_entries,
        "compare_entries": index.compare_entries,
        "call_counts": _counter_to_data(index.call_counts),
        "field_counts": _counter_to_data(index.field_counts),
        "aliases": [
            {
                "name": alias.name,
                "description": alias.description,
                "values": list(alias.values),
                "evidence": alias.evidence,
            }
            for alias in sorted(index.aliases.values(), key=lambda item: item.name)
        ],
        "class_docs": [
            {
                "class": class_name,
                "description": doc.description,
                "evidence": list(doc.evidence),
            }
            for class_name, doc in sorted(index.class_docs.items())
        ],
        "method_docs": [
            {
                "class": class_name,
                "method": method_name,
                "description": doc.description,
                "evidence": list(doc.evidence),
            }
            for (class_name, method_name), doc in sorted(index.method_docs.items())
        ],
        "field_docs": [
            {
                "class": class_name,
                "field": field_name,
                "description": doc.description,
                "evidence": list(doc.evidence),
            }
            for (class_name, field_name), doc in sorted(index.field_docs.items())
        ],
        "method_param_type_overrides": [
            {
                "class": class_name,
                "method": method_name,
                "param": param_name,
                "type": typ,
            }
            for (class_name, method_name, param_name), typ in sorted(index.method_param_type_overrides.items())
        ],
        "field_type_overrides": [
            {
                "class": class_name,
                "field": field_name,
                "type": typ,
            }
            for (class_name, field_name), typ in sorted(index.field_type_overrides.items())
        ],
        "raw_story_flags": _counter_to_data(index.raw_story_flags),
        "raw_global_flags": _counter_to_data(index.raw_global_flags),
    }


def unity_usage_index_from_data(data: dict) -> UnityUsageIndex:
    index = UnityUsageIndex()
    index.source_txt = data.get("source_txt")
    index.source_md = data.get("source_md")
    index.script_entries = int(data.get("script_entries", 0))
    index.compare_entries = int(data.get("compare_entries", 0))
    index.call_counts = _counter_from_data(data.get("call_counts"))
    index.field_counts = _counter_from_data(data.get("field_counts"))
    index.aliases = {
        entry["name"]: UsageAlias(
            entry["name"],
            entry["description"],
            tuple(entry.get("values", [])),
            entry["evidence"],
        )
        for entry in data.get("aliases", [])
    }
    index.class_docs = {
        entry["class"]: UsageDoc(entry["description"], tuple(entry.get("evidence", [])))
        for entry in data.get("class_docs", [])
    }
    index.method_docs = {
        (entry["class"], entry["method"]): UsageDoc(entry["description"], tuple(entry.get("evidence", [])))
        for entry in data.get("method_docs", [])
    }
    index.field_docs = {
        (entry["class"], entry["field"]): UsageDoc(entry["description"], tuple(entry.get("evidence", [])))
        for entry in data.get("field_docs", [])
    }
    index.method_param_type_overrides = {
        (entry["class"], entry["method"], entry["param"]): entry["type"]
        for entry in data.get("method_param_type_overrides", [])
    }
    index.field_type_overrides = {
        (entry["class"], entry["field"]): entry["type"]
        for entry in data.get("field_type_overrides", [])
    }
    index.raw_story_flags = _counter_from_data(data.get("raw_story_flags"))
    index.raw_global_flags = _counter_from_data(data.get("raw_global_flags"))
    return index


def load_unity_usage_index(path: Path) -> UnityUsageIndex | None:
    if not path.exists():
        return None
    return unity_usage_index_from_data(json.loads(path.read_text(encoding="utf-8")))


def save_unity_usage_index(index: UnityUsageIndex, path: Path) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(json.dumps(unity_usage_index_to_data(index), indent=2, ensure_ascii=False) + "\n", encoding="utf-8")


def decode_scene_value(raw: str) -> str:
    raw = raw.strip()
    if not raw:
        return ""
    if raw[0] in {"'", '"'} and raw[-1:] == raw[0]:
        try:
            value = ast.literal_eval(raw)
            return str(value)
        except (SyntaxError, ValueError):
            return unquote_lua_string(raw)
    return raw


def scene_entries(path: Path) -> list[UnitySceneEntry]:
    entries: list[UnitySceneEntry] = []
    if not path.exists():
        return entries
    pattern = re.compile(r"^\s*(luaScript|luaCompareString):\s*(.*)$")
    for line_number, line in enumerate(path.read_text(encoding="utf-8").splitlines(), start=1):
        match = pattern.match(line)
        if not match:
            continue
        entries.append(UnitySceneEntry(match.group(1), line_number, decode_scene_value(match.group(2))))
    return entries


def string_literals(text: str) -> list[str]:
    return [unquote_lua_string(match.group(0)) for match in re.finditer(LUA_STRING_PATTERN, text)]


def first_string_args(text: str, method_name: str) -> list[str]:
    pattern = rf"\b{re.escape(method_name)}\s*\(\s*({LUA_STRING_PATTERN})"
    return [unquote_lua_string(match.group(1)) for match in re.finditer(pattern, text, re.DOTALL)]


def method_first_string_args(text: str, method_name: str) -> list[str]:
    pattern = rf"(?:\b[A-Za-z_][A-Za-z0-9_]*|\))\s*[.:]\s*{re.escape(method_name)}\s*\(\s*({LUA_STRING_PATTERN})"
    return [unquote_lua_string(match.group(1)) for match in re.finditer(pattern, text, re.DOTALL)]


def add_values(target: set[str], values: list[str]) -> None:
    for value in values:
        cleaned = value.strip()
        if cleaned:
            target.add(cleaned)


def count_values(counter: Counter[str], values: list[str]) -> None:
    for value in values:
        cleaned = value.strip()
        if cleaned:
            counter[cleaned] += 1


def parse_calls_and_fields(text: str, index: UnityUsageIndex) -> None:
    owner_types = {
        "gv": "GameVariables",
        "browser": "BrowserPopup",
        "botStatusApp": "BotStatusAppPopup",
        "flowchart": "Flowchart",
        "Save": "SaveContainer",
        "SaveSingleton": "SaveSingleton",
        "newsDataManager": "NewsDataManager",
    }
    for var_name in re.findall(r"\b([A-Za-z_][A-Za-z0-9_]*)\s*=\s*UiOverlay\.OpenBrowser\s*\(", text):
        owner_types[var_name] = "BrowserPopup"
    for var_name in re.findall(
        r"\b([A-Za-z_][A-Za-z0-9_]*)\s*=\s*UiOverlay\.(?:OpenBotStatusApp|GetCurrentlyOpenedBotStatusApp)\s*\(",
        text,
    ):
        owner_types[var_name] = "BotStatusAppPopup"

    for match in re.finditer(r"\b([A-Za-z_][A-Za-z0-9_]*)\s*([.:])\s*([A-Za-z_][A-Za-z0-9_]*)\s*\(", text):
        owner, method = match.group(1), match.group(3)
        owner_type = owner_types.get(owner, owner)
        index.call_counts[f"{owner_type}.{method}"] += 1

    chain_patterns = [
        (r"\bUiOverlay\.GetCurrentlyOpenedBrowser\s*\(\s*\)\s*[.:]\s*([A-Za-z_][A-Za-z0-9_]*)\s*\(", "BrowserPopup"),
        (r"\bUiOverlay\.OpenBrowser\s*\([^)]*\)\s*[.:]\s*([A-Za-z_][A-Za-z0-9_]*)\s*\(", "BrowserPopup"),
        (
            r"\bUiOverlay\.(?:GetCurrentlyOpenedBotStatusApp|OpenBotStatusApp|OpenBotStatusAppPrologue)\s*\(\s*\)\s*[.:]\s*([A-Za-z_][A-Za-z0-9_]*)\s*\(",
            "BotStatusAppPopup",
        ),
    ]
    for pattern, owner_type in chain_patterns:
        for match in re.finditer(pattern, text):
            index.call_counts[f"{owner_type}.{match.group(1)}"] += 1

    save_references = len(re.findall(r"\bGameUtilities\.Save\b", text))
    if save_references:
        index.field_counts["GameUtilities.Save"] += save_references

    for match in re.finditer(r"\b([A-Za-z_][A-Za-z0-9_]*)\.([A-Za-z_][A-Za-z0-9_]*)\b(?!\s*\()", text):
        owner, field_name = match.group(1), match.group(2)
        owner_type = owner_types.get(owner)
        if owner_type:
            index.field_counts[f"{owner_type}.{field_name}"] += 1


def add_unity_docs(index: UnityUsageIndex) -> None:
    def has_call(key: str) -> bool:
        return index.call_counts.get(key, 0) > 0

    def has_field(key: str) -> bool:
        return index.field_counts.get(key, 0) > 0

    def method(class_name: str, method_name: str, description: str) -> None:
        if has_call(f"{class_name}.{method_name}"):
            index.method_docs[(class_name, method_name)] = UsageDoc(description, ("unity/mainScene.txt",))

    def field_doc(class_name: str, field_name: str, description: str) -> None:
        if has_field(f"{class_name}.{field_name}"):
            index.field_docs[(class_name, field_name)] = UsageDoc(description, ("unity/mainScene.txt",))

    index.class_docs["BrowserPopup"] = UsageDoc(
        "Browser UI interno observado em scripts de flowchart/Fungus extraidos da cena principal.",
        ("unity/mainScene.txt",),
    )
    index.class_docs["BotStatusAppPopup"] = UsageDoc(
        "Popup interno do BotStatusApp observado em scripts de flowchart/Fungus extraidos da cena principal.",
        ("unity/mainScene.txt",),
    )
    index.class_docs["NewsDataManager"] = UsageDoc(
        "Gerenciador de noticias usado por scripts internos para escolher ou forcar noticias.",
        ("unity/mainScene.txt",),
    )

    method("UiOverlay", "OpenBrowser", "Abre o browser interno; scripts de cena usam para navegar em websites do jogo.")
    method("UiOverlay", "GetCurrentlyOpenedBrowser", "Retorna o browser interno atualmente aberto, quando existir.")
    method("UiOverlay", "OpenBotStatusApp", "Abre o BotStatusApp interno.")
    method("UiOverlay", "OpenBotStatusAppPrologue", "Abre o BotStatusApp em modo/prologo interno.")
    method("UiOverlay", "GetCurrentlyOpenedBotStatusApp", "Retorna o BotStatusApp atualmente aberto, quando existir.")
    method("BrowserPopup", "ChangeWebsite", "Navega o browser interno para um website do jogo.")
    method("BrowserPopup", "SelectEmail", "Seleciona um email pelo indice no browser interno.")
    method("BrowserPopup", "JoinUsOpenBlogLoginPage", "Abre a pagina de login de blog JoinUs por id interno.")
    method("BrowserPopup", "JoinUsLogin_Enumerator", "Coroutine interna de login do JoinUs.")
    method("BrowserPopup", "JoinUsOpenBlog_Enumerator", "Coroutine interna para abrir um blog JoinUs por id.")
    method("BotStatusAppPopup", "ShowFile", "Mostra um arquivo/pagina interna do BotStatusApp.")
    method("BotStatusAppPopup", "ForceSubmitPlayerInput", "Forca o envio de input do jogador no BotStatusApp.")
    method("BotStatusAppPopup", "WaitTillPlayerInputNeeded", "Coroutine que espera ate o BotStatusApp precisar de input do jogador.")
    method("NewsDataManager", "Force", "Forca uma noticia especifica usando NewsId e GameId.")
    method("Flowchart", "SetIntegerVariable", "Define uma variavel inteira em um flowchart Fungus.")
    method("Flowchart", "SetBooleanVariable", "Define uma variavel booleana em um flowchart Fungus.")
    method("GameVariables", "CheckFlag", "Verifica uma flag de historia/save.")
    method("GameVariables", "CheckFlagBeforeRelative", "Verifica uma flag considerando limite relativo de tempo.")
    method("GameVariables", "CheckFlagAfterRelative", "Verifica se uma flag existe ha pelo menos certo tempo relativo.")
    method("GameVariables", "GetFlagSetCount", "Conta flags/estados relacionados a um identificador ou prefixo.")
    method("GameVariables", "ForceTakeMoney", "Remove dinheiro diretamente e retorna se a operacao foi aplicada.")
    method("GameVariables", "TryTakeMoney", "Tenta remover dinheiro e retorna sucesso ou falha.")
    method("GameVariables", "RemoveAllEmailsWithId", "Remove emails do save pelo id informado.")
    method("GameVariables", "BotCleanWithRagEffect", "Aplica o efeito interno de limpeza do bot com pano.")
    method("GameVariables", "ClearMood", "Limpa ou reseta o estado de humor atual.")
    method("GameVariables", "TimeInDay", "Calcula uma posicao de tempo no dia a partir de hora e minuto.")
    method("GameVariables", "ReportSleepEnd", "Registra o fim de uma rotina de sono.")
    method("SaveContainer", "AddGlobalFlag", "Adiciona uma global flag ao save atual.")
    method("SaveContainer", "HasGlobalFlag", "Retorna se o save atual possui uma global flag.")
    method("SaveContainer", "TryGetGlobalFlag", "Tenta obter uma global flag do save atual.")

    field_doc("GameVariables", "newsDataManager", "Gerenciador de noticias acessado por scripts internos de cena.")
    field_doc("GameUtilities", "Save", "SaveContainer atual usado por scripts internos para global flags.")


def add_unity_type_overrides(index: UnityUsageIndex) -> None:
    if "MdrgKnownWebsiteId" in index.aliases:
        index.method_param_type_overrides[("BrowserPopup", "ChangeWebsite", "address")] = "MdrgKnownWebsiteId|string"
        index.method_param_type_overrides[("UiOverlay", "OpenBrowser", "website")] = "MdrgKnownWebsiteId|string"
    if "MdrgKnownJoinUsBlogId" in index.aliases:
        index.method_param_type_overrides[("BrowserPopup", "JoinUsOpenBlogLoginPage", "key")] = "MdrgKnownJoinUsBlogId|string"
        index.method_param_type_overrides[("BrowserPopup", "JoinUsOpenBlog_Enumerator", "key")] = "MdrgKnownJoinUsBlogId|string"
    if "MdrgKnownBotStatusFileId" in index.aliases:
        index.method_param_type_overrides[("BotStatusAppPopup", "ShowFile", "text")] = "MdrgKnownBotStatusFileId|string"
    if "MdrgKnownStoryFlagId" in index.aliases:
        for method_name in [
            "CheckFlag",
            "CheckFlagBeforeRelative",
            "CheckFlagAfterRelative",
            "CheckFlagWithTime",
            "CheckFlagSpecial",
            "CheckFlagSpecialWithTime",
            "GetFlagSetCount",
        ]:
            index.method_param_type_overrides[("GameVariables", method_name, "flag")] = "MdrgKnownStoryFlagId|string"
    if "MdrgKnownGlobalFlagId" in index.aliases:
        for method_name in ["AddGlobalFlag", "HasGlobalFlag", "TryGetGlobalFlag"]:
            index.method_param_type_overrides[("SaveContainer", method_name, "flagName")] = "MdrgKnownGlobalFlagId|string"


def build_unity_usage_index(root: Path) -> UnityUsageIndex:
    index = UnityUsageIndex()
    txt_path = root / "unity" / "mainScene.txt"
    md_path = root / "unity" / "mainScene.md"
    if not txt_path.exists():
        return index

    entries = scene_entries(txt_path)
    index.source_txt = str(txt_path.relative_to(root))
    if md_path.exists():
        index.source_md = str(md_path.relative_to(root))
    index.script_entries = sum(1 for entry in entries if entry.kind == "luaScript")
    index.compare_entries = sum(1 for entry in entries if entry.kind == "luaCompareString")
    text = "\n".join(entry.text for entry in entries)

    parse_calls_and_fields(text, index)

    websites: set[str] = set()
    joinus_blog_ids: set[str] = set()
    bot_status_file_ids: set[str] = set()
    story_flags: set[str] = set()
    global_flags: set[str] = set()

    add_values(websites, method_first_string_args(text, "ChangeWebsite"))
    add_values(websites, method_first_string_args(text, "OpenBrowser"))
    websites.update(INTERNAL_BROWSER_WEBSITE_IDS)
    add_values(joinus_blog_ids, method_first_string_args(text, "JoinUsOpenBlogLoginPage"))
    add_values(joinus_blog_ids, method_first_string_args(text, "JoinUsOpenBlog_Enumerator"))
    add_values(bot_status_file_ids, method_first_string_args(text, "ShowFile"))

    for method_name in [
        "CheckFlag",
        "CheckFlagBeforeRelative",
        "CheckFlagAfterRelative",
        "CheckFlagWithTime",
        "CheckFlagSpecial",
        "CheckFlagSpecialWithTime",
        "GetFlagSetCount",
    ]:
        values = method_first_string_args(text, method_name)
        add_values(story_flags, values)
        count_values(index.raw_story_flags, values)

    for method_name in ["AddGlobalFlag", "HasGlobalFlag", "TryGetGlobalFlag"]:
        values = method_first_string_args(text, method_name)
        add_values(global_flags, values)
        count_values(index.raw_global_flags, values)

    add_alias(
        index,
        "MdrgKnownWebsiteId",
        "Internal browser website ids observed in Lua/mainScene/browser scripts.",
        websites,
        "unity/mainScene.txt; browser scripts",
    )
    add_alias(index, "MdrgKnownJoinUsBlogId", "Internal JoinUs blog ids observed in mainScene Lua snippets.", joinus_blog_ids, "unity/mainScene.txt")
    add_alias(index, "MdrgKnownBotStatusFileId", "Internal BotStatusApp file ids observed in mainScene Lua snippets.", bot_status_file_ids, "unity/mainScene.txt")
    add_alias(index, "MdrgKnownStoryFlagId", "Story/save flag ids observed in mainScene Lua conditions.", story_flags, "unity/mainScene.txt")
    add_alias(index, "MdrgKnownGlobalFlagId", "Global save flag ids observed in mainScene Lua snippets.", global_flags, "unity/mainScene.txt")

    add_unity_docs(index)
    add_unity_type_overrides(index)
    return index


def runtime_alias(index: dict | None, name: str) -> dict | None:
    if not index:
        return None
    for alias in index.get("runtime_aliases", []):
        if alias.get("name") == name:
            return alias
    return None


def runtime_alias_note(index: dict | None, name: str) -> str | None:
    alias = runtime_alias(index, name)
    if not alias:
        return None
    value = alias.get("value") or alias.get("type") or "present"
    return f"---Runtime probe confirmed `{name}` as {value}."


def emit_legacy_runtime_aliases(index: UnityUsageIndex, header_lines: list[str], runtime_probe: dict | None = None) -> list[str]:
    lines = list(header_lines)
    gv_note = runtime_alias_note(runtime_probe, "gv")
    flowchart_note = runtime_alias_note(runtime_probe, "flowchart")
    lines.extend(
        [
            "-- Legacy/internal runtime helpers observed in Unity mainScene Lua snippets.",
            "-- These symbols are documented separately from regular modding APIs.",
            "",
            "---Legacy/internal alias observed in flowchart/Fungus Lua snippets.",
            "---Prefer GameVariables in new mod scripts.",
            *( [gv_note] if gv_note else [] ),
            "---@deprecated Use GameVariables instead.",
            "---@type GameVariables",
            "gv = GameVariables",
            "",
            "---Flowchart object injected into internal Fungus Lua snippets.",
            "---This is not confirmed as a normal mod-script global.",
            *( [flowchart_note] if flowchart_note else [] ),
            "---@type Flowchart",
            "flowchart = flowchart",
            "",
        ]
    )
    for alias in sorted(index.aliases.values(), key=lambda item: item.name):
        lines.append(f"---{alias.description}")
        lines.append(f"---@alias {alias.name}")
        for value in alias.values:
            lines.append(f"---| {lua_string_literal(value)}")
        lines.append("")
    return lines


def render_unity_report(
    index: UnityUsageIndex,
    accepted_docs: list[str],
    rejected_docs: list[str],
    accepted_type_overrides: list[str],
    rejected_type_overrides: list[str],
) -> str:
    lines = [
        "# Unity mainScene stub improvements",
        "",
        "Generated from `unity/mainScene.txt`; `unity/mainScene.md` is used as analysis guidance only.",
        "",
        "## Input summary",
        "",
        f"- Source txt: `{index.source_txt}`",
        f"- Source md: `{index.source_md}`",
        f"- `luaScript` entries: {index.script_entries}",
        f"- `luaCompareString` entries: {index.compare_entries}",
        "",
        "## Most frequent calls",
        "",
    ]
    for key, count in sorted(index.call_counts.items(), key=lambda item: (-item[1], item[0].lower(), item[0]))[:35]:
        lines.append(f"- `{key}`: {count}")

    lines.extend(["", "## Most frequent fields", ""])
    for key, count in sorted(index.field_counts.items(), key=lambda item: (-item[1], item[0].lower(), item[0]))[:35]:
        lines.append(f"- `{key}`: {count}")

    lines.extend(["", "## Generated legacy aliases", ""])
    for alias in sorted(index.aliases.values(), key=lambda item: item.name):
        lines.append(f"- `{alias.name}`: {len(alias.values)} values from {alias.evidence}")

    lines.extend(["", "## Most frequent story flags", ""])
    for key, count in sorted(index.raw_story_flags.items(), key=lambda item: (-item[1], item[0].lower(), item[0]))[:25]:
        lines.append(f"- `{key}`: {count}")

    lines.extend(["", "## Global flags", ""])
    if index.raw_global_flags:
        for key, count in sorted(index.raw_global_flags.items(), key=lambda item: (-item[1], item[0].lower(), item[0])):
            lines.append(f"- `{key}`: {count}")
    else:
        lines.append("- None")

    lines.extend(["", "## Accepted documentation changes", ""])
    if accepted_docs:
        for item in sorted(accepted_docs):
            lines.append(f"- `{item}`")
    else:
        lines.append("- None")

    lines.extend(["", "## Rejected documentation candidates", ""])
    if rejected_docs:
        for item in sorted(rejected_docs):
            lines.append(f"- `{item}`")
    else:
        lines.append("- None")

    lines.extend(["", "## Accepted type/autocomplete overrides", ""])
    if accepted_type_overrides:
        for item in sorted(accepted_type_overrides):
            lines.append(f"- `{item}`")
    else:
        lines.append("- None")

    lines.extend(["", "## Rejected type/autocomplete overrides", ""])
    if rejected_type_overrides:
        for item in sorted(rejected_type_overrides):
            lines.append(f"- `{item}`")
    else:
        lines.append("- None")

    lines.extend(
        [
            "",
            "## Validation notes",
            "",
            "- Legacy aliases are emitted in `mdrg_legacy_runtime_aliases.d.lua`, separate from regular modding aliases.",
            "- Documentation/type candidates are applied only when the class/member exists in `docs.txt` generated stubs.",
            "- Flag and website aliases keep `|string` fallbacks when used in parameter types.",
        ]
    )
    return "\n".join(lines).rstrip() + "\n"


if __name__ == "__main__":
    workspace = Path(__file__).resolve().parents[1]
    usage_index = build_unity_usage_index(workspace)
    print(f"Source txt: {usage_index.source_txt}")
    print(f"luaScript entries: {usage_index.script_entries}")
    print(f"luaCompareString entries: {usage_index.compare_entries}")
    print(f"Aliases: {len(usage_index.aliases)}")
    print(f"Method doc candidates: {len(usage_index.method_docs)}")
    print(f"Field doc candidates: {len(usage_index.field_docs)}")

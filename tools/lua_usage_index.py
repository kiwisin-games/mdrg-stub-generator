from __future__ import annotations

import json
import re
from collections import Counter
from dataclasses import dataclass, field
from pathlib import Path


LUA_STRING_PATTERN = r"'(?:\\.|[^'\\])*'|\"(?:\\.|[^\"\\])*\""


@dataclass(frozen=True)
class UsageDoc:
    description: str
    evidence: tuple[str, ...]


@dataclass(frozen=True)
class UsageAlias:
    name: str
    description: str
    values: tuple[str, ...]
    evidence: str


@dataclass
class LuaUsageIndex:
    lua_files: list[str] = field(default_factory=list)
    md_files: list[str] = field(default_factory=list)
    paired_md_files: list[str] = field(default_factory=list)
    guide_md_files: list[str] = field(default_factory=list)
    call_counts: Counter[str] = field(default_factory=Counter)
    separator_counts: Counter[str] = field(default_factory=Counter)
    field_counts: Counter[str] = field(default_factory=Counter)
    aliases: dict[str, UsageAlias] = field(default_factory=dict)
    class_docs: dict[str, UsageDoc] = field(default_factory=dict)
    method_docs: dict[tuple[str, str], UsageDoc] = field(default_factory=dict)
    field_docs: dict[tuple[str, str], UsageDoc] = field(default_factory=dict)
    method_param_type_overrides: dict[tuple[str, str, str], str] = field(default_factory=dict)
    field_type_overrides: dict[tuple[str, str], str] = field(default_factory=dict)
    md_luadoc_blocks: int = 0
    md_suggested_symbols: Counter[str] = field(default_factory=Counter)

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


def lua_usage_index_to_data(index: LuaUsageIndex) -> dict:
    return {
        "schema_version": 1,
        "lua_files": index.lua_files,
        "md_files": index.md_files,
        "paired_md_files": index.paired_md_files,
        "guide_md_files": index.guide_md_files,
        "call_counts": _counter_to_data(index.call_counts),
        "separator_counts": _counter_to_data(index.separator_counts),
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
        "md_luadoc_blocks": index.md_luadoc_blocks,
        "md_suggested_symbols": _counter_to_data(index.md_suggested_symbols),
    }


def lua_usage_index_from_data(data: dict) -> LuaUsageIndex:
    index = LuaUsageIndex()
    index.lua_files = list(data.get("lua_files", []))
    index.md_files = list(data.get("md_files", []))
    index.paired_md_files = list(data.get("paired_md_files", []))
    index.guide_md_files = list(data.get("guide_md_files", []))
    index.call_counts = _counter_from_data(data.get("call_counts"))
    index.separator_counts = _counter_from_data(data.get("separator_counts"))
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
    index.md_luadoc_blocks = int(data.get("md_luadoc_blocks", 0))
    index.md_suggested_symbols = _counter_from_data(data.get("md_suggested_symbols"))
    return index


def load_lua_usage_index(path: Path) -> LuaUsageIndex | None:
    if not path.exists():
        return None
    return lua_usage_index_from_data(json.loads(path.read_text(encoding="utf-8")))


def save_lua_usage_index(index: LuaUsageIndex, path: Path) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(json.dumps(lua_usage_index_to_data(index), indent=2, ensure_ascii=False) + "\n", encoding="utf-8")


def unquote_lua_string(token: str) -> str:
    token = token.strip()
    if len(token) < 2:
        return token
    body = token[1:-1]
    result: list[str] = []
    i = 0
    while i < len(body):
        ch = body[i]
        if ch != "\\" or i + 1 >= len(body):
            result.append(ch)
            i += 1
            continue
        nxt = body[i + 1]
        mapping = {
            "n": "\n",
            "r": "\r",
            "t": "\t",
            "\\": "\\",
            "'": "'",
            '"': '"',
        }
        result.append(mapping.get(nxt, nxt))
        i += 2
    return "".join(result)


def string_literals(text: str) -> list[str]:
    return [unquote_lua_string(match.group(0)) for match in re.finditer(LUA_STRING_PATTERN, text)]


def lua_string_literal(value: str) -> str:
    escaped = value.replace("\\", "\\\\").replace('"', '\\"')
    return f"'\"{escaped}\"'"


def add_counter_values(target: set[str], values: list[str]) -> None:
    for value in values:
        cleaned = value.strip()
        if cleaned:
            target.add(cleaned)


def extract_first_string_arg(text: str, call_name: str) -> list[str]:
    pattern = rf"\b{re.escape(call_name)}\s*\(\s*({LUA_STRING_PATTERN})"
    return [unquote_lua_string(match.group(1)) for match in re.finditer(pattern, text, re.DOTALL)]


def extract_qualified_first_string_arg(text: str, qualified_name: str) -> list[str]:
    owner, call_name = qualified_name.split(".", 1)
    pattern = rf"\b{re.escape(owner)}\s*\.\s*{re.escape(call_name)}\s*\(\s*({LUA_STRING_PATTERN})"
    return [unquote_lua_string(match.group(1)) for match in re.finditer(pattern, text, re.DOTALL)]


def extract_method_first_string_arg(text: str, method_name: str) -> list[str]:
    pattern = rf"(?:\b[A-Za-z_][A-Za-z0-9_]*|\))\s*[.:]\s*{re.escape(method_name)}\s*\(\s*({LUA_STRING_PATTERN})"
    return [unquote_lua_string(match.group(1)) for match in re.finditer(pattern, text, re.DOTALL)]


def extract_second_string_arg(text: str, call_name: str) -> list[str]:
    pattern = rf"\b{re.escape(call_name)}\s*\([^,]+,\s*({LUA_STRING_PATTERN})"
    return [unquote_lua_string(match.group(1)) for match in re.finditer(pattern, text, re.DOTALL)]


def extract_assignment_strings(text: str, field_name: str) -> list[str]:
    values: list[str] = []
    scalar_pattern = rf"\.{re.escape(field_name)}\s*=\s*({LUA_STRING_PATTERN})"
    values.extend(unquote_lua_string(match.group(1)) for match in re.finditer(scalar_pattern, text, re.DOTALL))

    table_pattern = rf"\.{re.escape(field_name)}\s*=\s*\{{(?P<body>.*?)\}}"
    for match in re.finditer(table_pattern, text, re.DOTALL):
        values.extend(string_literals(match.group("body")))
    return values


def extract_call_table_strings(text: str, method_name: str) -> list[str]:
    values: list[str] = []
    pattern = rf"\.{re.escape(method_name)}\s*\(\s*\{{(?P<body>.*?)\}}\s*\)"
    for match in re.finditer(pattern, text, re.DOTALL):
        values.extend(string_literals(match.group("body")))
    return values


def extract_texture_controller_ids(paths: list[str]) -> set[str]:
    controllers: set[str] = set()
    for path in paths:
        filename = path.replace("\\", "/").rsplit("/", 1)[-1]
        match = re.search(r"\btex(?:ture)?\s*\d+\s*-\s*(?P<ids>.+?)\.json$", filename, re.IGNORECASE)
        if not match:
            continue
        for part in match.group("ids").split(","):
            cleaned = part.strip().lower()
            if cleaned:
                controllers.add(cleaned)
    return controllers


def extract_dialogue_directives(texts: list[str]) -> set[str]:
    directives: set[str] = set()
    for text in texts:
        for match in re.finditer(r"(?m)#([A-Za-z_][A-Za-z0-9_]*)", text):
            directives.add("#" + match.group(1))
    return directives


def extract_dialogue_placeholders(texts: list[str]) -> set[str]:
    placeholders: set[str] = set()
    for text in texts:
        for match in re.finditer(r"\{([A-Za-z_][A-Za-z0-9_]*)\}", text):
            placeholders.add("{" + match.group(1) + "}")
    return placeholders


def infer_variable_types(text: str) -> dict[str, str]:
    variable_types: dict[str, str] = {}
    patterns = [
        (r"\blocal\s+([A-Za-z_][A-Za-z0-9_]*)\s*=\s*ModUtilities\.CreateItemPrefab\s*\(", "ItemPrefab"),
        (r"\blocal\s+([A-Za-z_][A-Za-z0-9_]*)\s*=\s*SlotEquipData\.CreateInstance\s*\(", "SlotEquipData"),
        (r"\blocal\s+([A-Za-z_][A-Za-z0-9_]*)\s*=\s*ModUtilities\.PrepareNewPersonalityDefinition\s*\(", "LuaPersonalityModuleDefinition"),
        (r"\blocal\s+([A-Za-z_][A-Za-z0-9_]*)\s*=\s*EdibleItemPrefabData\.CreateInstance\w*\s*\(", "EdibleItemPrefabData"),
        (r"\blocal\s+([A-Za-z_][A-Za-z0-9_]*)\s*=\s*ModUtilities\.GetPackedTexture\s*\(", "PackedTexturesContainer"),
        (r"\blocal\s+([A-Za-z_][A-Za-z0-9_]*)\s*=\s*ModUtilities\.CreateNewItem\w*\s*\(", "GameId"),
    ]
    for pattern, type_name in patterns:
        for match in re.finditer(pattern, text):
            variable_types[match.group(1)] = type_name

    for match in re.finditer(r"\b(itemprefab\d*)\b", text):
        variable_types.setdefault(match.group(1), "ItemPrefab")
    return variable_types


def parse_calls_and_fields(text: str, index: LuaUsageIndex) -> None:
    variable_types = infer_variable_types(text)
    call_pattern = re.compile(r"\b([A-Za-z_][A-Za-z0-9_]*)\s*([.:])\s*([A-Za-z_][A-Za-z0-9_]*)\s*\(")
    for match in call_pattern.finditer(text):
        owner, sep, method = match.group(1), match.group(2), match.group(3)
        owner_type = variable_types.get(owner, owner)
        key = f"{owner_type}.{method}"
        index.call_counts[key] += 1
        index.separator_counts[f"{key}{sep}"] += 1

    # Chained PrepareContainer(...).AddBranch(...) has no simple identifier owner.
    add_branch_count = len(re.findall(r"\)\s*\.AddBranch\s*\(", text))
    if add_branch_count:
        index.call_counts["StoryBotDialogueBranchContainer.AddBranch"] += add_branch_count
        index.separator_counts["StoryBotDialogueBranchContainer.AddBranch."] += add_branch_count

    field_pattern = re.compile(r"\b([A-Za-z_][A-Za-z0-9_]*)\.([A-Za-z_][A-Za-z0-9_]*)\s*=")
    for match in field_pattern.finditer(text):
        owner, field_name = match.group(1), match.group(2)
        owner_type = variable_types.get(owner)
        if owner_type:
            index.field_counts[f"{owner_type}.{field_name}"] += 1


def extract_md_luadoc(md_text: str, index: LuaUsageIndex) -> None:
    for match in re.finditer(r"```lua\s*(.*?)```", md_text, re.DOTALL | re.IGNORECASE):
        block = match.group(1)
        if "---@" not in block:
            continue
        index.md_luadoc_blocks += 1
        for class_match in re.finditer(r"---@class\s+([A-Za-z_][A-Za-z0-9_]*)", block):
            index.md_suggested_symbols[f"class:{class_match.group(1)}"] += 1
        for field_match in re.finditer(r"---@field\s+([A-Za-z_][A-Za-z0-9_]*)", block):
            index.md_suggested_symbols[f"field:{field_match.group(1)}"] += 1
        for fn_match in re.finditer(r"function\s+([A-Za-z_][A-Za-z0-9_]*)[.:]([A-Za-z_][A-Za-z0-9_]*)", block):
            index.md_suggested_symbols[f"method:{fn_match.group(1)}.{fn_match.group(2)}"] += 1


def sorted_values(values: set[str]) -> tuple[str, ...]:
    return tuple(sorted(values, key=lambda item: (item.lower(), item)))


def add_alias(index: LuaUsageIndex, name: str, description: str, values: set[str], evidence: str) -> None:
    cleaned = sorted_values({value for value in values if value})
    if cleaned:
        index.aliases[name] = UsageAlias(name, description, cleaned, evidence)


def add_usage_docs(index: LuaUsageIndex) -> None:
    def has_call(key: str) -> bool:
        return index.call_counts.get(key, 0) > 0

    def has_field(key: str) -> bool:
        return index.field_counts.get(key, 0) > 0

    def method(class_name: str, method_name: str, description: str, *evidence: str) -> None:
        if has_call(f"{class_name}.{method_name}"):
            index.method_docs[(class_name, method_name)] = UsageDoc(description, evidence)

    def field_doc(class_name: str, field_name: str, description: str, *evidence: str) -> None:
        if has_field(f"{class_name}.{field_name}"):
            index.field_docs[(class_name, field_name)] = UsageDoc(description, evidence)

    method("ModUtilities", "CreateItemPrefab", "Cria um ItemPrefab vazio para ser preenchido por script antes do registro do item.", "lua-call", "paired-md")
    method("ModUtilities", "CreateNewItemAutoAssignId", "Registra um ItemPrefab para o mod e retorna o GameId gerado para lojas e referencias.", "lua-call", "paired-md")
    method("ModUtilities", "AddSingleBuyItemToShop", "Adiciona um item registrado a uma loja como compra unica.", "lua-call", "paired-md")
    method("ModUtilities", "GetPackedTexture", "Carrega uma textura empacotada do mod usando CurrentModGuid e o caminho interno do asset.", "lua-call", "paired-md")
    method("ModUtilities", "PrepareNewPersonalityDefinition", "Cria uma definicao de personality module para receber containers e branches de dialogo.", "lua-call", "paired-md")
    method("ItemPrefab", "AddTexture", "Anexa uma textura empacotada ao prefab; o overload com controller limita a textura a uma cena/controller.", "lua-call", "paired-md")
    method("ItemPrefab", "TurnIntoPersonalityModule", "Liga um item registrado a uma definicao de personality module.", "lua-call", "paired-md")
    method("ColorSlot", "CreateInstance", "Cria um slot de cor configuravel usando um nome exibido e uma paleta.", "lua-call", "paired-md")
    method("ColorPaletteManager", "GetColorPaletteByName", "Busca uma paleta de cores pelo nome usado nos scripts gerados.", "lua-call", "paired-md")
    method("SlotEquipData", "CreateInstance", "Cria dados de slot/equipamento; quando informado, define o slot alvo do item.", "lua-call", "paired-md")
    method("SlotEquipData", "SetRequiredSlotsString", "Define os slots que precisam estar presentes ou compativeis para este equipamento.", "lua-call", "paired-md")
    method("SlotEquipData", "SetForbiddenSlotsString", "Define os slots incompativeis ou proibidos para este equipamento.", "lua-call", "paired-md")
    method("EdibleItemPrefabData", "CreateInstance", "Cria dados de item comestivel; o callback preenche o perfil nutricional do item.", "lua-call", "paired-md")
    method("ItemModifiableVariableFactory", "CreateInstanceBoolBackedVariable", "Cria uma variavel booleana modificavel usada por condicoes de elementos/texturas.", "lua-call", "paired-md")
    method("ItemModifiableVariableFactory", "CreateInstanceFloatVariable", "Cria uma variavel numerica modificavel usada por sliders e ajustes visuais.", "lua-call", "paired-md")
    method("ItemScopeConditionSpecialVariable", "CreateInstance", "Cria uma condicao baseada no nome de uma variavel modificavel do item.", "lua-call", "paired-md")
    method("AtLeastOneBoolVariableTrueRequirement", "CreateInstance", "Cria uma regra que exige ao menos uma das variaveis booleanas indicadas ativa.", "lua-call", "paired-md")
    method("SimpleLocalizedString", "CreateInstanceReplacement", "Cria um texto localizado simples a partir de uma string literal exibida ao jogador.", "lua-call", "paired-md")
    method("LuaPersonalityModuleDefinition", "PrepareContainer", "Retorna ou prepara um container de dialogo identificado por tag/stage.", "lua-call", "paired-md")
    method("StoryBotDialogueBranch", "__new", "Cria uma branch de dialogo; scripts gerados usam o overload com texto, Guid do mod e indice local.", "lua-call", "paired-md")
    method("StoryBotDialogueBranchContainer", "AddBranch", "Adiciona uma branch de dialogo ao container e retorna o container para encadeamento.", "lua-call", "paired-md")

    if "MdrgKnownControllerId" in index.aliases:
        index.method_docs[("ModUtilities", "GetController")] = UsageDoc(
            "Retorna um controller/cena pelo identificador textual usado em texturas e overrides.",
            ("texture-path", "paired-md"),
        )

    field_doc("ItemPrefab", "SlotData", "Dados modernos de slot/equipamento usados para roupas, modulos e itens equipaveis.", "lua-field", "paired-md")
    field_doc("ItemPrefab", "EdibleData", "Dados que tornam o item comestivel e definem o callback de perfil nutricional.", "lua-field", "paired-md")
    field_doc("ItemPrefab", "ItemModifiableVariables", "Variaveis configuraveis do item usadas por condicoes e ajustes visuais.", "lua-field", "paired-md")
    field_doc("ItemPrefab", "ItemModifiableVariablesRequirements", "Regras aplicadas sobre as variaveis modificaveis do item.", "lua-field", "paired-md")
    field_doc("ItemPrefab", "IsPersonalityModule", "Marca o prefab como item de modulo de personalidade.", "lua-field", "paired-md")
    field_doc("SlotEquipData", "TargetSlotString", "Nome textual do slot alvo onde o item sera equipado.", "lua-field", "paired-md")
    field_doc("SlotEquipData", "ControllerElementOverride", "Elementos especificos do controller que este item substitui ou ativa.", "lua-field", "paired-md")
    field_doc("SlotEquipData", "ElementActiveConditions", "Condicoes que controlam a ativacao de elementos visuais.", "lua-field", "paired-md")
    field_doc("SlotEquipData", "TextureActiveConditions", "Condicoes que controlam a ativacao de texturas.", "lua-field", "paired-md")


def add_type_overrides(index: LuaUsageIndex) -> None:
    if "MdrgKnownShopId" in index.aliases:
        index.method_param_type_overrides[("ModUtilities", "AddSingleBuyItemToShop", "shopId")] = "MdrgKnownShopId|string"
    if "MdrgKnownControllerId" in index.aliases:
        index.method_param_type_overrides[("ModUtilities", "GetController", "id")] = "MdrgKnownControllerId|string"
    if "MdrgKnownPaletteName" in index.aliases:
        index.method_param_type_overrides[("ColorPaletteManager", "GetColorPaletteByName", "name")] = "MdrgKnownPaletteName|string"
    if "MdrgKnownColorSlotName" in index.aliases:
        index.method_param_type_overrides[("ColorSlot", "CreateInstance", "name")] = "MdrgKnownColorSlotName|string"
    if "MdrgKnownEquipmentSlotId" in index.aliases:
        index.method_param_type_overrides[("SlotEquipData", "CreateInstance", "slotString")] = "MdrgKnownEquipmentSlotId|string"
        index.method_param_type_overrides[("SlotEquipData", "SetRequiredSlotsString", "requiredSlots")] = "(MdrgKnownEquipmentSlotId|string)[]"
        index.method_param_type_overrides[("SlotEquipData", "SetForbiddenSlotsString", "forbiddenSlots")] = "(MdrgKnownEquipmentSlotId|string)[]"
        index.field_type_overrides[("SlotEquipData", "TargetSlotString")] = "MdrgKnownEquipmentSlotId|string"
    if "MdrgKnownControllerElementOverride" in index.aliases:
        index.field_type_overrides[("SlotEquipData", "ControllerElementOverride")] = "(MdrgKnownControllerElementOverride|string)[]"
    if "MdrgKnownDialogueContainerId" in index.aliases:
        index.method_param_type_overrides[("LuaPersonalityModuleDefinition", "PrepareContainer", "tagId")] = "MdrgKnownDialogueContainerId|string"


def build_lua_usage_index(root: Path) -> LuaUsageIndex:
    index = LuaUsageIndex()
    luas_dir = root / "luas"
    if not luas_dir.exists():
        return index

    lua_files = sorted(luas_dir.glob("*.lua"))
    md_files = sorted(luas_dir.glob("*.md"))
    index.lua_files = [path.name for path in lua_files]
    index.md_files = [path.name for path in md_files]

    lua_bases = {path.stem for path in lua_files}
    index.paired_md_files = [path.name for path in md_files if path.stem in lua_bases]
    index.guide_md_files = [path.name for path in md_files if path.stem not in lua_bases]

    shop_ids: set[str] = set()
    controller_ids: set[str] = set()
    palette_names: set[str] = set()
    color_slot_names: set[str] = set()
    equipment_slots: set[str] = set()
    controller_element_overrides: set[str] = set()
    dialogue_container_ids: set[str] = set()
    dialogue_directives: set[str] = set()
    dialogue_placeholders: set[str] = set()

    for path in lua_files:
        text = path.read_text(encoding="utf-8")
        parse_calls_and_fields(text, index)
        add_counter_values(shop_ids, extract_first_string_arg(text, "AddSingleBuyItemToShop"))
        add_counter_values(shop_ids, extract_first_string_arg(text, "AddGenericItemToShop"))
        packed_texture_paths = extract_second_string_arg(text, "GetPackedTexture")
        add_counter_values(controller_ids, extract_first_string_arg(text, "GetController"))
        controller_ids.update(extract_texture_controller_ids(packed_texture_paths))
        add_counter_values(palette_names, extract_qualified_first_string_arg(text, "ColorPaletteManager.GetColorPaletteByName"))
        add_counter_values(color_slot_names, extract_qualified_first_string_arg(text, "ColorSlot.CreateInstance"))
        add_counter_values(equipment_slots, extract_qualified_first_string_arg(text, "SlotEquipData.CreateInstance"))
        add_counter_values(equipment_slots, extract_assignment_strings(text, "TargetSlotString"))
        add_counter_values(equipment_slots, extract_call_table_strings(text, "SetRequiredSlotsString"))
        add_counter_values(equipment_slots, extract_call_table_strings(text, "SetForbiddenSlotsString"))
        add_counter_values(controller_element_overrides, extract_assignment_strings(text, "ControllerElementOverride"))
        add_counter_values(dialogue_container_ids, extract_method_first_string_arg(text, "PrepareContainer"))
        branch_texts = extract_first_string_arg(text, "__new")
        dialogue_directives.update(extract_dialogue_directives(branch_texts))
        dialogue_placeholders.update(extract_dialogue_placeholders(branch_texts))

    # The generic CreateInstance extractor is intentionally broad; keep only values
    # confirmed by slot-like usage patterns or common generated slot names.
    non_slot_values = palette_names | color_slot_names
    equipment_slots = {value for value in equipment_slots if value not in non_slot_values and not value.startswith("/")}

    for path in md_files:
        extract_md_luadoc(path.read_text(encoding="utf-8"), index)

    add_alias(index, "MdrgKnownShopId", "Shop ids observed in Lua scripts generated by the game.", shop_ids, "luas/*.lua")
    add_alias(index, "MdrgKnownControllerId", "Controller/scene ids observed directly or in generated packed texture paths.", controller_ids, "luas/*.lua")
    add_alias(index, "MdrgKnownPaletteName", "Color palette names observed in generated item scripts.", palette_names, "luas/*.lua")
    add_alias(index, "MdrgKnownColorSlotName", "Color slot display names observed in generated item scripts.", color_slot_names, "luas/*.lua")
    add_alias(index, "MdrgKnownEquipmentSlotId", "Equipment slot ids observed in generated item scripts.", equipment_slots, "luas/*.lua")
    add_alias(index, "MdrgKnownControllerElementOverride", "Controller element override ids observed in generated item scripts.", controller_element_overrides, "luas/*.lua")
    add_alias(index, "MdrgKnownDialogueContainerId", "Dialogue container ids observed in generated personality scripts.", dialogue_container_ids, "luas/*.lua")
    add_alias(index, "MdrgKnownDialogueDirective", "Dialogue text directives observed in generated personality scripts.", dialogue_directives, "luas/*.lua")
    add_alias(index, "MdrgKnownDialoguePlaceholder", "Dialogue placeholders observed in generated personality scripts.", dialogue_placeholders, "luas/*.lua")

    add_usage_docs(index)
    add_type_overrides(index)
    return index


def emit_usage_aliases(index: LuaUsageIndex, header_lines: list[str]) -> list[str]:
    lines = list(header_lines)
    lines.extend(
        [
            "-- Usage-oriented aliases extracted from Lua scripts generated by the game.",
            "-- These aliases are autocomplete helpers only; generated stubs keep string fallbacks.",
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


def render_usage_report(
    index: LuaUsageIndex,
    accepted_docs: list[str],
    rejected_docs: list[str],
    accepted_type_overrides: list[str],
    rejected_type_overrides: list[str],
) -> str:
    lines = [
        "# Lua usage stub improvements",
        "",
        "Generated from `luas/*.lua` and `luas/*.md`.",
        "",
        "## Input summary",
        "",
        f"- Lua files: {len(index.lua_files)} (`{', '.join(index.lua_files)}`)",
        f"- Markdown files: {len(index.md_files)} (`{', '.join(index.md_files)}`)",
        f"- Paired markdown files: {len(index.paired_md_files)}",
        f"- Guide-only markdown files: {len(index.guide_md_files)} (`{', '.join(index.guide_md_files)}`)",
        f"- LuaDoc suggestion blocks found in markdown: {index.md_luadoc_blocks}",
        "",
        "## Most frequent calls",
        "",
    ]
    for key, count in sorted(index.call_counts.items(), key=lambda item: (-item[1], item[0].lower(), item[0]))[:30]:
        lines.append(f"- `{key}`: {count}")

    lines.extend(["", "## Most frequent assigned fields", ""])
    for key, count in sorted(index.field_counts.items(), key=lambda item: (-item[1], item[0].lower(), item[0]))[:30]:
        lines.append(f"- `{key}`: {count}")

    lines.extend(["", "## Generated aliases", ""])
    for alias in sorted(index.aliases.values(), key=lambda item: item.name):
        lines.append(f"- `{alias.name}`: {len(alias.values)} values from {alias.evidence}")

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
            "- Documentation candidates are applied only when the class/member exists in `docs.txt` generated classes.",
            "- Alias values come from generated Lua scripts, not from free-form markdown suggestions.",
            "- Type overrides keep `|string` fallbacks for custom mod values.",
        ]
    )
    return "\n".join(lines).rstrip() + "\n"


if __name__ == "__main__":
    workspace = Path(__file__).resolve().parents[1]
    usage_index = build_lua_usage_index(workspace)
    print(f"Lua files: {len(usage_index.lua_files)}")
    print(f"Paired markdown files: {len(usage_index.paired_md_files)}")
    print(f"Guide-only markdown files: {len(usage_index.guide_md_files)}")
    print(f"Aliases: {len(usage_index.aliases)}")
    print(f"Method doc candidates: {len(usage_index.method_docs)}")
    print(f"Field doc candidates: {len(usage_index.field_docs)}")

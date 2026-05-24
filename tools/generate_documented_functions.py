from __future__ import annotations

from collections import Counter, defaultdict
from dataclasses import dataclass
from pathlib import Path
import datetime as _dt
import re
from typing import Iterable


ROOT = Path(__file__).resolve().parents[1]
UNDOCUMENTED = ROOT / "undocumented_functions.md"
DOCS = ROOT / "docs.txt"
RAWDUMP = ROOT / "rawdump"
DUMP = ROOT / "dump"
ANALYSIS_DIRS = [ROOT / "analysis", ROOT / "luas"]
OUTPUT = ROOT / "documented_functions.md"


SECTION_RE = re.compile(r"^##\s+(.+?)\s*$")
SOURCE_TYPE_RE = re.compile(r"^- Source type:\s+`(.+?)`\s*$")
FUNCTION_RE = re.compile(r"^- \[ \]\s+`docs\.txt:(\d+)`\s+`(.+?)`\s*$")
LUA_RE = re.compile(r"^\s+Lua:\s+`(.+?)`\s*$")
LUA_SIG_RE = re.compile(r"^(.+?)([.:])([A-Za-z_]\w*)\((.*)\)\s*->\s*(.+)$")


BOILERPLATE_FORBIDDEN = [
    "il2cpp_runtime_invoke",
    "NativeMethodInfoPtr",
    "IntPtr",
    "Il2CppObjectBaseToPtr",
]

GENERIC_DOCUMENTATION_PATTERNS = tuple(
    re.compile(pattern)
    for pattern in [
        r"^Tipo C# exposto ao Lua/MoonSharp\b",
        r"^Tipo de .* exposto ao Lua/MoonSharp\b",
        r"^Tipo do sistema de .* exposto ao Lua/MoonSharp\b",
        r"^Executa a operacao runtime exposta por ",
        r"^Retorna dados\.$",
        r"^Configura dados\.$",
        r"^Cria uma nova instancia de [A-Za-z_][\w.]*\.$",
        r"^Cria uma instancia de [A-Za-z_][\w.]*\.$",
        r"^Retorna uma representacao textual desta instancia\.$",
        r"^Compara esta instancia com outro valor ou instancia compativel\.$",
        r"^Retorna o hash desta instancia\.$",
    ]
)

STRONG_DOCUMENTED_EVIDENCE = {
    "manual",
    "usage",
    "lua-call",
    "paired-md",
    "texture-path",
    "unity/mainScene.txt",
}


CLASS_DOCS: dict[str, str] = {
    "ModUtilities": "Helper exposto a scripts Lua de mods para criar e registrar itens, carregar assets, adicionar itens a lojas, preparar personality modules, acessar controllers e controlar coroutines do runtime.",
    "ItemPrefab": "Modelo configuravel de item antes/depois do registro no jogo; scripts normalmente preenchem campos, anexam texturas/dados opcionais e registram o item via ModUtilities.",
    "Item": "Instancia runtime de um item no inventario/equipamento, usada em callbacks como OnUse e SpecialEffectAction.",
    "StoryCondition": "Base de condicoes usadas pelo sistema de historia/eventos para verificar requisitos, combinar condicoes e gerar representacoes textuais ou de codigo.",
    "LuaStoryCondition": "Condicao de historia baseada em codigo Lua/MoonSharp informado por script.",
    "LuaPersonalityModuleDefinition": "Definicao Lua de personality module; agrupa containers de dialogo e depois e ligada a um item registrado.",
    "StoryBotDialogueBranch": "Ramo de dialogo do bot usado por personality modules e containers de fala.",
    "StoryBotDialogueBranchContainer": "Container de ramos de dialogo associados a um identificador de fala/evento.",
    "TextureOverriderManager": "Gerenciador de override/restauracao de sprites/texturas por alvo visual, usado por efeitos de item e room overrides.",
    "UiOverlay": "Utilitarios de overlay e popups de UI expostos ao Lua.",
    "GameUtilities": "Utilitarios gerais do jogo expostos ao Lua, incluindo transicoes de view, inventario e esperas para coroutine.",
    "GameVariables": "Estado global do jogo exposto para leitura, escrita e condicoes.",
    "GameId": "Identificador de item ou recurso do jogo, incluindo itens vanilla e itens registrados por mods.",
    "ColorSlot": "Define um slot de cor editavel de item, normalmente associado a uma paleta.",
    "ColorPalette": "Colecao de cores configuraveis usada por slots de cor.",
    "ColorPaletteManager": "Acesso a paletas de cor registradas pelo jogo.",
    "SlotEquipData": "Dados modernos de equipamento/slot para ItemPrefab, incluindo slots possiveis, obrigatorios e proibidos.",
    "SusModifier": "Modificador de cobertura/suspeita associado a areas visuais de um item.",
    "EdibleItemPrefabData": "Dados especificos de comida/consumivel associados a ItemPrefab.EdibleData.",
    "FishItemPrefabData": "Dados especificos de peixe associados a ItemPrefab.FishData.",
    "ItemModifiableVariableFactory": "Factory de variaveis modificaveis associadas a itens e condicoes de elementos visuais.",
    "ItemScopeCondition": "Base de condicoes de escopo de item usadas por requisitos e elementos dependentes de variaveis.",
    "ItemScopeConditionSpecialVariable": "Condicao de escopo de item baseada em variavel especial/modificavel.",
}


METHOD_DOCS: dict[tuple[str, str], str] = {
    ("ModUtilities", "CreateItemPrefab"): "Cria um ItemPrefab configuravel por scripts Lua antes do registro do item.",
    ("ModUtilities", "CreateNewItemAutoAssignId"): "Registra um ItemPrefab para um mod e retorna um GameId gerado automaticamente.",
    ("ModUtilities", "CreateNewItem"): "Registra um ItemPrefab para um mod e retorna o GameId do item registrado.",
    ("ModUtilities", "AddSingleBuyItemToShop"): "Adiciona um item registrado a uma loja como compra unica.",
    ("ModUtilities", "AddGenericItemToShop"): "Adiciona um item registrado a uma loja como item generico/recompravel.",
    ("ModUtilities", "GetModFile"): "Retorna um arquivo do pacote do mod pelo Guid do mod e caminho interno.",
    ("ModUtilities", "GetPackedTexture"): "Carrega um container de textura empacotada do pacote do mod.",
    ("ModUtilities", "GetTexture"): "Carrega uma Texture2D do pacote do mod.",
    ("ModUtilities", "GetTextureReference"): "Cria uma referencia automatica para uma Texture2D do pacote do mod.",
    ("ModUtilities", "GetSprite"): "Carrega uma Sprite a partir de um asset do pacote do mod.",
    ("ModUtilities", "GetSpriteReference"): "Cria uma referencia automatica para uma Sprite do pacote do mod.",
    ("ModUtilities", "GetAsSprite"): "Cria uma referencia de Sprite convertida a partir de uma textura do pacote do mod.",
    ("ModUtilities", "PrepareNewPersonalityDefinition"): "Cria uma definicao de personality module para receber containers e ramos de dialogo.",
    ("ModUtilities", "StartCoroutine"): "Inicia uma closure MoonSharp como coroutine gerenciada pelo runtime de mods.",
    ("ModUtilities", "StopCoroutine"): "Para uma coroutine iniciada pelo runtime de mods.",
    ("ModUtilities", "WaitForSeconds"): "Cria um objeto de espera para ser usado com coroutine.yield em scripts Lua.",
    ("ModUtilities", "GetController"): "Retorna o ControllerEnum associado a um identificador textual de controller/cena.",
    ("GameUtilities", "WaitForSecondsYield"): "Cria um objeto de espera para atrasar uma coroutine Lua pelo numero de segundos informado.",
    ("ItemPrefab", "AddTexture"): "Anexa uma textura empacotada ao prefab, opcionalmente limitada a um controller/cena.",
    ("ItemPrefab", "AddAtLeastOneEnabledAllModifiableVariablesRequirement"): "Adiciona requisito para que pelo menos uma variavel modificavel do item esteja habilitada.",
    ("ItemPrefab", "AddAtLeastOneEnabledModifiableVariablesRequirement"): "Adiciona requisito para que pelo menos uma das variaveis modificaveis indicadas esteja habilitada.",
    ("ItemPrefab", "AddBoolModifiableVariable"): "Adiciona uma variavel modificavel booleana ao prefab.",
    ("ItemPrefab", "AddFloatModifiableVariable"): "Adiciona uma variavel modificavel numerica ao prefab.",
    ("ItemPrefab", "AddItemModifiableVariablesRequirement"): "Adiciona um requisito baseado nas variaveis modificaveis do item.",
    ("ItemPrefab", "AddHoodieLogoTexture"): "Adiciona uma textura de logo modificavel para hoodie/roupa compativel.",
    ("ItemPrefab", "AddModdableLogos"): "Adiciona configuracoes de logos modificaveis ao prefab.",
    ("ItemPrefab", "TurnIntoPersonalityModule"): "Configura o item registrado como personality module usando uma definicao Lua.",
    ("ItemPrefab", "MakeSet"): "Marca ou cria associacao de conjunto entre itens relacionados.",
    ("ItemPrefab", "MakePair"): "Marca dois itens como par/conjunto relacionado.",
    ("Item", "GetCount"): "Retorna a quantidade empilhada da instancia runtime do item.",
    ("Item", "GetUniqueGuid"): "Retorna o Guid unico da instancia runtime do item.",
    ("Item", "IsEquipped"): "Retorna se a instancia runtime do item esta equipada.",
    ("Item", "GetItemPrefab"): "Retorna o ItemPrefab associado a esta instancia runtime do item.",
    ("Item", "GetMainColorFromAdditionalData"): "Le a cor principal armazenada nos dados adicionais da instancia do item.",
    ("Item", "SetColorIntoAdditionalData"): "Grava uma cor em um slot dos dados adicionais da instancia do item.",
    ("StoryCondition", "Lua"): "Cria uma condicao de historia avaliada por codigo Lua.",
    ("StoryCondition", "Delegate"): "Cria uma condicao de historia avaliada por callback booleano.",
    ("StoryCondition", "And"): "Combina condicoes e exige que todas sejam verdadeiras.",
    ("StoryCondition", "Or"): "Combina condicoes e exige que pelo menos uma seja verdadeira.",
    ("StoryCondition", "NotAnd"): "Combina condicoes com negacao do resultado de And.",
    ("StoryCondition", "NotOr"): "Combina condicoes com negacao do resultado de Or.",
    ("LuaPersonalityModuleDefinition", "PrepareContainer"): "Retorna ou prepara um container de dialogo identificado por tag/stage.",
    ("StoryBotDialogueBranchContainer", "AddBranch"): "Adiciona um ramo de dialogo ao container.",
    ("TextureOverriderManager", "SetSprite"): "Aplica override de sprite em um alvo visual, opcionalmente escopado por Guid unico.",
    ("TextureOverriderManager", "RestoreSprite"): "Restaura o sprite original de um alvo visual previamente alterado.",
    ("TextureOverriderManager", "GetSpecialEffectsAction"): "Cria um callback compativel com SpecialEffectAction para aplicar/restaurar sprite de alvo visual.",
    ("UiOverlay", "OkPopup"): "Mostra um popup simples com titulo, texto e acao opcional de OK.",
    ("UiOverlay", "CloseUiOverlay"): "Fecha o overlay de UI atualmente aberto.",
}


WORD_TRANSLATIONS = {
    "action": "acao",
    "actions": "acoes",
    "active": "ativo",
    "all": "todos",
    "audio": "audio",
    "bool": "booleana",
    "boolean": "booleana",
    "branch": "ramo",
    "branches": "ramos",
    "callback": "callback",
    "clip": "clip",
    "color": "cor",
    "condition": "condicao",
    "conditions": "condicoes",
    "container": "container",
    "controller": "controller",
    "current": "atual",
    "data": "dados",
    "default": "padrao",
    "description": "descricao",
    "enabled": "habilitado",
    "file": "arquivo",
    "guid": "guid",
    "id": "id",
    "identifier": "identificador",
    "item": "item",
    "items": "itens",
    "localizable": "localizavel",
    "manager": "gerenciador",
    "modifiable": "modificavel",
    "module": "modulo",
    "music": "musica",
    "name": "nome",
    "new": "novo",
    "pair": "par",
    "palette": "paleta",
    "popup": "popup",
    "prefab": "prefab",
    "price": "preco",
    "reference": "referencia",
    "requirement": "requisito",
    "requirements": "requisitos",
    "resource": "recurso",
    "result": "resultado",
    "scene": "cena",
    "slot": "slot",
    "slots": "slots",
    "song": "musica",
    "special": "especial",
    "sprite": "sprite",
    "stat": "estatistica",
    "string": "string",
    "summary": "resumo",
    "target": "alvo",
    "text": "texto",
    "texture": "textura",
    "time": "tempo",
    "value": "valor",
    "variable": "variavel",
    "variables": "variaveis",
    "view": "view",
}


@dataclass(slots=True)
class FunctionEntry:
    section: str
    source_type: str
    docs_line: int
    csharp_signature: str
    lua_signature: str
    lua_owner: str
    separator: str
    method: str
    params: list[tuple[str, str]]
    return_type: str


@dataclass(slots=True)
class ClassSection:
    name: str
    source_type: str
    functions: list[FunctionEntry]


@dataclass(slots=True)
class DumpInfo:
    path: Path
    text: str
    methods: set[str]
    fields: set[str]


@dataclass(slots=True)
class DocDecision:
    description: str
    confidence: str
    evidence: list[str]


def luadoc_omission_reason(doc: DocDecision) -> str | None:
    if doc.confidence not in {"high", "medium"}:
        return "low-confidence"
    if not doc.description:
        return "empty"
    if any(pattern.search(doc.description) for pattern in GENERIC_DOCUMENTATION_PATTERNS):
        return "generic"
    evidence = set(doc.evidence)
    if "fallback" in evidence:
        return "fallback"
    if "name-pattern" in evidence and not (evidence & STRONG_DOCUMENTED_EVIDENCE):
        return "name-pattern"
    return None


def read_text(path: Path) -> str:
    return path.read_text(encoding="utf-8", errors="replace")


def rel(path: Path | None) -> str:
    if path is None:
        return "not found"
    try:
        return path.relative_to(ROOT).as_posix()
    except ValueError:
        return path.as_posix()


def code_span(value: str) -> str:
    if "`" in value:
        return f"`` {value} ``"
    return f"`{value}`"


def split_params(text: str) -> list[str]:
    if not text.strip():
        return []
    parts: list[str] = []
    start = 0
    depth = 0
    for index, char in enumerate(text):
        if char in "([{<":
            depth += 1
        elif char in ")]}>" and depth > 0:
            depth -= 1
        elif char == "," and depth == 0:
            parts.append(text[start:index].strip())
            start = index + 1
    parts.append(text[start:].strip())
    return [part for part in parts if part]


def parse_lua_signature(lua_signature: str) -> tuple[str, str, str, list[tuple[str, str]], str]:
    match = LUA_SIG_RE.match(lua_signature)
    if not match:
        raise ValueError(f"Could not parse Lua signature: {lua_signature}")
    owner, separator, method, params_text, return_type = match.groups()
    params: list[tuple[str, str]] = []
    for index, param in enumerate(split_params(params_text), start=1):
        if ":" in param:
            name, type_name = param.split(":", 1)
            name = name.strip()
            type_name = type_name.strip()
        else:
            name = param.strip() or f"arg{index}"
            type_name = "any"
        if not re.match(r"^[A-Za-z_]\w*$", name):
            name = f"arg{index}"
        params.append((name, type_name))
    return owner, separator, method, params, return_type.strip()


def parse_undocumented() -> list[ClassSection]:
    lines = read_text(UNDOCUMENTED).splitlines()
    sections: list[ClassSection] = []
    current_name = ""
    current_source = ""
    current_functions: list[FunctionEntry] = []
    pending: tuple[int, str] | None = None

    def flush() -> None:
        nonlocal current_functions
        if current_name:
            sections.append(ClassSection(current_name, current_source or current_name, current_functions))
        current_functions = []

    for line in lines:
        if section_match := SECTION_RE.match(line):
            flush()
            current_name = section_match.group(1)
            current_source = ""
            pending = None
            continue
        if source_match := SOURCE_TYPE_RE.match(line):
            current_source = source_match.group(1)
            continue
        if function_match := FUNCTION_RE.match(line):
            pending = (int(function_match.group(1)), function_match.group(2))
            continue
        if lua_match := LUA_RE.match(line):
            if pending is None:
                continue
            docs_line, csharp_signature = pending
            lua_signature = lua_match.group(1)
            owner, separator, method, params, return_type = parse_lua_signature(lua_signature)
            current_functions.append(
                FunctionEntry(
                    section=current_name,
                    source_type=current_source,
                    docs_line=docs_line,
                    csharp_signature=csharp_signature,
                    lua_signature=lua_signature,
                    lua_owner=owner,
                    separator=separator,
                    method=method,
                    params=params,
                    return_type=return_type,
                )
            )
            pending = None
    flush()
    return sections


def simplify_source_type(source_type: str) -> str:
    text = source_type
    if "[[" in text:
        text = text.split("[[", 1)[0]
    text = re.sub(r"`\d+$", "", text)
    text = text.replace("+", ".")
    return text.strip(".")


def simple_name(source_type: str, fallback: str) -> str:
    simplified = simplify_source_type(source_type)
    if simplified:
        return simplified.split(".")[-1]
    if re.match(r"^[A-Za-z_]\w*$", fallback):
        return fallback
    return fallback.split(".")[-1]


def normalized_stem(path: Path) -> str:
    return re.sub(r"`\d+$", "", path.stem)


def extract_methods(text: str) -> set[str]:
    methods: set[str] = set()
    pattern = re.compile(
        r"\b(?:public|protected|internal|private)\s+"
        r"(?:unsafe\s+)?(?:static\s+)?(?:virtual\s+)?(?:override\s+)?(?:abstract\s+)?"
        r"(?:new\s+)?[A-Za-z_][\w<>,\[\].? ]*\s+([A-Za-z_]\w*)\s*\(",
    )
    for match in pattern.finditer(text):
        methods.add(match.group(1))
    return methods


def extract_fields(text: str) -> set[str]:
    fields: set[str] = set()
    pattern = re.compile(
        r"\b(?:public|protected|internal)\s+"
        r"(?:readonly\s+)?(?:static\s+)?[A-Za-z_][\w<>,\[\].? ]*\s+([A-Za-z_]\w*)\s*(?:=|;)",
    )
    for match in pattern.finditer(text):
        name = match.group(1)
        if not name.startswith("Native"):
            fields.add(name)
    return fields


def build_dump_index(root: Path) -> dict[str, list[DumpInfo]]:
    index: dict[str, list[DumpInfo]] = defaultdict(list)
    if not root.exists():
        return index
    for path in root.rglob("*.cs"):
        text = read_text(path)
        info = DumpInfo(path=path, text=text, methods=extract_methods(text), fields=extract_fields(text))
        index[normalized_stem(path)].append(info)
    return index


def candidate_names(section: ClassSection) -> list[str]:
    names: list[str] = []
    for value in [section.source_type, section.name]:
        if not value:
            continue
        simplified = simplify_source_type(value)
        candidates = [simplified, simplified.split(".")[-1]]
        for candidate in candidates:
            candidate = re.sub(r"`\d+$", "", candidate)
            if candidate and candidate not in names:
                names.append(candidate)
    return names


def pick_dump_info(section: ClassSection, index: dict[str, list[DumpInfo]]) -> DumpInfo | None:
    for candidate in candidate_names(section):
        direct = index.get(candidate)
        if direct:
            return direct[0]
    for candidate in candidate_names(section):
        low = candidate.lower()
        for key, values in index.items():
            if key.lower() == low:
                return values[0]
    return None


def build_usage_index() -> dict[str, set[str]]:
    usage: dict[str, set[str]] = defaultdict(set)
    for directory in ANALYSIS_DIRS:
        if not directory.exists():
            continue
        for path in directory.rglob("*.md"):
            text = read_text(path)
            for match in re.finditer(r"`([A-Za-z_]\w*)\.([A-Za-z_]\w*)`", text):
                usage[f"{match.group(1)}.{match.group(2)}"].add(rel(path))
    return usage


def words_from_camel(name: str) -> str:
    text = re.sub(r"[_]+", " ", name)
    text = re.sub(r"(?<=[a-z0-9])(?=[A-Z])", " ", text)
    text = re.sub(r"(?<=[A-Z])(?=[A-Z][a-z])", " ", text)
    words = text.strip().lower().split()
    return " ".join(WORD_TRANSLATIONS.get(word, word) for word in words)


def subject_from_method(method: str, prefix: str) -> str:
    rest = method[len(prefix) :]
    words = words_from_camel(rest)
    return words or "valor"


def type_phrase(type_name: str) -> str:
    if type_name in {"nil", "void", "Void"}:
        return "nil"
    return type_name.replace("[]", "[]")


def infer_class_doc(section: ClassSection, raw_info: DumpInfo | None, dump_info: DumpInfo | None) -> DocDecision:
    name = simple_name(section.source_type, section.name)
    manual = CLASS_DOCS.get(section.name) or CLASS_DOCS.get(name)
    if manual:
        evidence = ["manual", "usage" if (ROOT / "analysis").exists() else "docs.txt"]
        if raw_info:
            evidence.append("rawdump")
        return DocDecision(manual, "high", evidence)

    source = simplify_source_type(section.source_type)
    searchable = f"{source} {section.name} {name}".lower()
    if "condition" in searchable:
        desc = "Tipo de condicao exposto ao Lua/MoonSharp para verificar requisitos, explicar a condicao e/ou gerar representacao de codigo."
        confidence = "medium" if raw_info or dump_info else "low"
        evidence = ["rawdump" if raw_info else "dump" if dump_info else "fallback", "name-pattern"]
    elif "item" in searchable:
        desc = "Tipo do sistema de itens exposto ao Lua/MoonSharp para criar, consultar ou configurar dados relacionados a itens."
        confidence = "medium" if raw_info or dump_info else "low"
        evidence = ["rawdump" if raw_info else "dump" if dump_info else "fallback", "name-pattern"]
    elif "reference" in searchable or "resource" in searchable:
        desc = "Tipo de referencia/recurso serializavel exposto ao Lua/MoonSharp para localizar ou carregar assets do jogo/mod."
        confidence = "medium" if raw_info or dump_info else "low"
        evidence = ["rawdump" if raw_info else "dump" if dump_info else "fallback", "name-pattern"]
    elif "result" in searchable:
        desc = "Tipo de resultado exposto ao Lua/MoonSharp para representar a saida ou estado de uma operacao."
        confidence = "medium" if raw_info or dump_info else "low"
        evidence = ["rawdump" if raw_info else "dump" if dump_info else "fallback", "name-pattern"]
    elif "view" in searchable or "scene" in searchable or "controller" in searchable:
        desc = "Tipo do sistema de view/cena/controller exposto ao Lua/MoonSharp para interagir com estado visual do jogo."
        confidence = "medium" if raw_info or dump_info else "low"
        evidence = ["rawdump" if raw_info else "dump" if dump_info else "fallback", "name-pattern"]
    elif "stat" in searchable or "variable" in searchable:
        desc = "Tipo de estatistica/variavel do jogo exposto ao Lua/MoonSharp para ler, alterar ou representar valores de estado."
        confidence = "medium" if raw_info or dump_info else "low"
        evidence = ["rawdump" if raw_info else "dump" if dump_info else "fallback", "name-pattern"]
    else:
        fields = len(raw_info.fields) if raw_info else len(dump_info.fields) if dump_info else 0
        methods = len(raw_info.methods) if raw_info else len(dump_info.methods) if dump_info else 0
        suffix = f" Possui {fields} campos e {methods} metodos identificados no dump." if fields or methods else ""
        desc = f"Tipo C# exposto ao Lua/MoonSharp para uso em scripts do jogo.{suffix}"
        confidence = "medium" if raw_info or dump_info else "low"
        evidence = ["rawdump" if raw_info else "dump" if dump_info else "fallback"]
    return DocDecision(desc, confidence, evidence)


def infer_method_doc(
    entry: FunctionEntry,
    section: ClassSection,
    raw_info: DumpInfo | None,
    dump_info: DumpInfo | None,
    usage_index: dict[str, set[str]],
) -> DocDecision:
    class_simple = simple_name(section.source_type, section.name)
    keys = [(entry.section, entry.method), (class_simple, entry.method), (entry.lua_owner, entry.method)]
    for key in keys:
        if key in METHOD_DOCS:
            evidence = ["manual"]
            if raw_info:
                evidence.append("rawdump")
            if usage_index.get(f"{key[0]}.{key[1]}"):
                evidence.append("usage")
            return DocDecision(METHOD_DOCS[key], "high", evidence)

    full_keys = {f"{entry.section}.{entry.method}", f"{class_simple}.{entry.method}", f"{entry.lua_owner}.{entry.method}"}
    usage_hits = sorted({hit for key in full_keys for hit in usage_index.get(key, set())})
    dump_has_method = bool(
        (raw_info and entry.method in raw_info.methods) or (dump_info and entry.method in dump_info.methods)
    )
    evidence = []
    if raw_info:
        evidence.append("rawdump")
    if dump_info:
        evidence.append("dump")
    if usage_hits:
        evidence.append("usage")

    method = entry.method
    ret = type_phrase(entry.return_type)

    if method == "__new":
        desc = f"Cria uma nova instancia de {entry.section}."
        evidence.append("name-pattern")
        confidence = "medium" if dump_has_method or raw_info or dump_info else "low"
    elif method == "ToString":
        desc = "Retorna uma representacao textual desta instancia."
        evidence.append("name-pattern")
        confidence = "medium"
    elif method == "Equals":
        desc = "Compara esta instancia com outro valor ou instancia compativel."
        evidence.append("name-pattern")
        confidence = "medium"
    elif method == "GetHashCode":
        desc = "Retorna o hash desta instancia."
        evidence.append("name-pattern")
        confidence = "medium"
    elif method == "ResetStat":
        desc = "Restaura esta estatistica para seu valor padrao."
        evidence.append("name-pattern")
        confidence = "medium" if "Stat" in class_simple or "Stat" in section.source_type else "low"
    elif method == "SetValue":
        desc = "Configura o valor armazenado nesta instancia."
        evidence.append("name-pattern")
        confidence = "medium"
    elif method == "GetValue":
        desc = "Retorna o valor armazenado nesta instancia."
        evidence.append("name-pattern")
        confidence = "medium"
    elif method == "GetIdentifier":
        desc = "Retorna o identificador associado a esta referencia ou recurso."
        evidence.append("name-pattern")
        confidence = "medium"
    elif method == "IsNull":
        desc = "Retorna se esta referencia ou valor esta nulo."
        evidence.append("name-pattern")
        confidence = "medium"
    elif method == "GetResource":
        desc = "Retorna o recurso associado a esta referencia."
        evidence.append("name-pattern")
        confidence = "medium"
    elif method == "Explain":
        desc = "Retorna uma descricao textual desta condicao ou objeto."
        evidence.append("name-pattern")
        confidence = "medium" if "Condition" in class_simple or "Result" in class_simple else "low"
    elif method == "GenerateCode":
        desc = "Gera uma representacao em codigo/script para esta instancia."
        evidence.append("name-pattern")
        confidence = "medium"
    elif method == "GenerateVariableName":
        desc = "Gera um nome de variavel textual para esta instancia."
        evidence.append("name-pattern")
        confidence = "medium"
    elif method in {"ConditionMet", "InnerConditionMet"}:
        desc = "Avalia se a condicao esta satisfeita no estado atual."
        evidence.append("name-pattern")
        confidence = "medium"
    elif method.startswith("Create"):
        target = subject_from_method(method, "Create")
        if method == "CreateInstance":
            desc = f"Cria uma instancia de {ret if ret != 'nil' else entry.section}."
        else:
            desc = f"Cria {target} e retorna {ret}." if ret != "nil" else f"Cria {target}."
        evidence.append("name-pattern")
        confidence = "medium" if dump_has_method or usage_hits else "low"
    elif method.startswith("Prepare"):
        target = subject_from_method(method, "Prepare")
        desc = f"Prepara {target} e retorna {ret}." if ret != "nil" else f"Prepara {target}."
        evidence.append("name-pattern")
        confidence = "medium" if dump_has_method or usage_hits else "low"
    elif method.startswith("Get"):
        target = subject_from_method(method, "Get")
        desc = f"Retorna {target}."
        evidence.append("name-pattern")
        confidence = "medium" if dump_has_method or usage_hits else "low"
    elif method.startswith("Set"):
        target = subject_from_method(method, "Set")
        desc = f"Configura {target}."
        evidence.append("name-pattern")
        confidence = "medium" if dump_has_method or usage_hits else "low"
    elif method.startswith("Add"):
        target = subject_from_method(method, "Add")
        desc = f"Adiciona {target}."
        evidence.append("name-pattern")
        confidence = "medium" if dump_has_method or usage_hits else "low"
    elif method.startswith("Remove"):
        target = subject_from_method(method, "Remove")
        desc = f"Remove {target}."
        evidence.append("name-pattern")
        confidence = "medium" if dump_has_method or usage_hits else "low"
    elif method.startswith("Is"):
        target = subject_from_method(method, "Is")
        desc = f"Retorna se {target}."
        evidence.append("name-pattern")
        confidence = "medium" if dump_has_method or usage_hits else "low"
    elif method.startswith("Has"):
        target = subject_from_method(method, "Has")
        desc = f"Retorna se possui {target}."
        evidence.append("name-pattern")
        confidence = "medium" if dump_has_method or usage_hits else "low"
    elif method.startswith("Make"):
        target = subject_from_method(method, "Make")
        desc = f"Configura ou cria a relacao de {target}."
        evidence.append("name-pattern")
        confidence = "medium" if dump_has_method or usage_hits else "low"
    else:
        desc = f"Executa a operacao runtime exposta por {entry.section}.{method}."
        evidence.append("fallback")
        confidence = "low" if not usage_hits else "medium"

    # If the wrapper/dump did not confirm the method name, keep confidence conservative.
    if not dump_has_method and not usage_hits and "manual" not in evidence:
        confidence = "low"
    return DocDecision(desc, confidence, dedupe(evidence))


def dedupe(values: Iterable[str]) -> list[str]:
    result: list[str] = []
    for value in values:
        if value not in result:
            result.append(value)
    return result


def luadoc_block(
    description: str | None,
    owner: str,
    section_name: str,
    entry: FunctionEntry | None = None,
) -> list[str]:
    lines: list[str] = []
    if description:
        lines.append(f"---{description}")
    if entry is None:
        lines.append(f"---@class {section_name}")
        return lines

    for name, type_name in entry.params:
        lines.append(f"---@param {name} {type_name}")
    if entry.return_type not in {"nil", "void", "Void"}:
        lines.append(f"---@return {entry.return_type}")
    params = ", ".join(name for name, _ in entry.params)
    lines.append(f"function {owner}{entry.separator}{entry.method}({params}) end")
    return lines


def fenced_lua(lines: list[str]) -> list[str]:
    return ["```lua", *lines, "```"]


def generate() -> tuple[list[str], Counter[str]]:
    sections = parse_undocumented()
    raw_index = build_dump_index(RAWDUMP)
    dump_index = build_dump_index(DUMP)
    usage_index = build_usage_index()
    confidence_counter: Counter[str] = Counter()
    omission_counter: Counter[str] = Counter()
    missing_rawdump = 0
    total_functions = 0
    functions_with_luadoc = 0
    classes_with_luadoc = 0

    out: list[str] = [
        "# documented_functions.md",
        "",
        f"Generated: {_dt.datetime.now().strftime('%Y-%m-%d %H:%M:%S')}",
        "",
        "Fonte gerada para revisar e copiar LuaDoc para os stubs MDRG. Cada entrada vem de `undocumented_functions.md` e recebe uma descricao balanceada com `Confidence` e `Evidence`.",
        "",
        "Notas:",
        "- `rawdump/` e `dump/` sao usados como evidencias de assinatura/contexto; wrappers Il2CppInterop nao sao descritos como comportamento.",
        "- Descricoes de baixa confianca sao intencionalmente conservadoras.",
        "- Este arquivo nao altera `library/` nem o gerador dos stubs.",
        "",
    ]

    for section in sections:
        raw_info = pick_dump_info(section, raw_index)
        dump_info = pick_dump_info(section, dump_index)
        class_doc = infer_class_doc(section, raw_info, dump_info)
        confidence_counter[f"class:{class_doc.confidence}"] += 1
        if raw_info is None:
            missing_rawdump += 1

        out.append(f"## {section.name}")
        out.append("")
        out.append(f"- Source type: {code_span(section.source_type)}")
        out.append(f"- Rawdump: {code_span(rel(raw_info.path if raw_info else None))}")
        out.append(f"- Dump fallback: {code_span(rel(dump_info.path if dump_info else None))}")
        out.append(f"- Class confidence: `{class_doc.confidence}`")
        out.append(f"- Class evidence: `{', '.join(class_doc.evidence)}`")
        out.append("- Class motivation:")
        class_omission = luadoc_omission_reason(class_doc)
        if class_omission:
            omission_counter[f"class:{class_omission}"] += 1
            out.append(f"- LuaDoc omitted: `{class_omission}`")
            out.extend(fenced_lua(luadoc_block(None, section.name, section.name)))
        else:
            classes_with_luadoc += 1
            out.extend(fenced_lua(luadoc_block(class_doc.description, section.name, section.name)))
        out.append("")

        for entry in section.functions:
            total_functions += 1
            doc = infer_method_doc(entry, section, raw_info, dump_info, usage_index)
            confidence_counter[f"function:{doc.confidence}"] += 1
            evidence = dedupe(doc.evidence or ["fallback"])
            out.append(f"### `{entry.method}`")
            out.append(f"- Source: `docs.txt:{entry.docs_line}`, {code_span(rel(raw_info.path if raw_info else None))}")
            out.append(f"- Confidence: `{doc.confidence}`")
            out.append(f"- Evidence: `{', '.join(evidence)}`")
            omission = luadoc_omission_reason(doc)
            if omission:
                omission_counter[f"function:{omission}"] += 1
                out.append(f"- LuaDoc omitted: `{omission}`")
                out.extend(fenced_lua(luadoc_block(None, entry.lua_owner, section.name, entry)))
            else:
                functions_with_luadoc += 1
                out.extend(fenced_lua(luadoc_block(doc.description, entry.lua_owner, section.name, entry)))
            out.append("")

    out.append("## Generation summary")
    out.append("")
    out.append(f"- Classes read: {len(sections)}")
    out.append(f"- Functions read: {total_functions}")
    out.append(f"- Classes with LuaDoc description: {classes_with_luadoc}")
    out.append(f"- Functions with LuaDoc description: {functions_with_luadoc}")
    out.append(f"- Functions with omitted LuaDoc description: {total_functions - functions_with_luadoc}")
    out.append(f"- Classes without rawdump match: {missing_rawdump}")
    out.append(f"- Function confidence high: {confidence_counter['function:high']}")
    out.append(f"- Function confidence medium: {confidence_counter['function:medium']}")
    out.append(f"- Function confidence low: {confidence_counter['function:low']}")
    out.append(f"- Class confidence high: {confidence_counter['class:high']}")
    out.append(f"- Class confidence medium: {confidence_counter['class:medium']}")
    out.append(f"- Class confidence low: {confidence_counter['class:low']}")
    out.append(f"- Omitted function docs by low-confidence: {omission_counter['function:low-confidence']}")
    out.append(f"- Omitted function docs by fallback: {omission_counter['function:fallback']}")
    out.append(f"- Omitted function docs by generic: {omission_counter['function:generic']}")
    out.append(f"- Omitted function docs by name-pattern: {omission_counter['function:name-pattern']}")
    out.append(f"- Omitted class docs by generic/name-pattern: {omission_counter['class:generic'] + omission_counter['class:name-pattern']}")
    out.append("")
    return out, confidence_counter


def validate(output: str, expected_functions: int, expected_classes: int) -> None:
    function_blocks = len(re.findall(r"^### `", output, flags=re.M))
    class_blocks = len(re.findall(r"^## (?!Generation summary)", output, flags=re.M))
    if function_blocks != expected_functions:
        raise RuntimeError(f"Expected {expected_functions} function blocks, got {function_blocks}")
    if class_blocks != expected_classes:
        raise RuntimeError(f"Expected {expected_classes} class blocks, got {class_blocks}")
    for forbidden in BOILERPLATE_FORBIDDEN:
        if forbidden in output:
            raise RuntimeError(f"Forbidden boilerplate leaked into output: {forbidden}")
    if "Confidence: `" not in output:
        raise RuntimeError("No Confidence markers found")
    if "Class motivation:" not in output:
        raise RuntimeError("No class motivations found")


def main() -> None:
    sections = parse_undocumented()
    expected_functions = sum(len(section.functions) for section in sections)
    output_lines, confidence_counter = generate()
    output = "\n".join(output_lines)
    validate(output, expected_functions, len(sections))
    OUTPUT.write_text(output, encoding="utf-8")
    print(f"Wrote {rel(OUTPUT)}")
    print(f"Classes: {len(sections)}")
    print(f"Functions: {expected_functions}")
    print(
        "Function confidence: "
        f"high={confidence_counter['function:high']} "
        f"medium={confidence_counter['function:medium']} "
        f"low={confidence_counter['function:low']}"
    )


if __name__ == "__main__":
    main()

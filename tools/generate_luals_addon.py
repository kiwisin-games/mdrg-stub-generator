from __future__ import annotations

import json
import re
import shutil
from collections import defaultdict
from dataclasses import dataclass, field
from pathlib import Path
from typing import Iterable

from lua_usage_index import (
    LuaUsageIndex,
    build_lua_usage_index,
    emit_usage_aliases,
    load_lua_usage_index,
    render_usage_report,
)
from probe_runtime_index import load_runtime_probe_index, render_runtime_probe_report
from unity_usage_index import (
    UnityUsageIndex,
    build_unity_usage_index,
    emit_legacy_runtime_aliases,
    load_unity_usage_index,
    render_unity_report,
)


ROOT = Path(__file__).resolve().parents[1]
DOCS = ROOT / "docs.txt"
DOCUMENTED_FUNCTIONS = ROOT / "documented_functions.md"
DUMP = ROOT / "dump"
RAWDUMP = ROOT / "rawdump"
DATA = ROOT / "data"
EXTERN = ROOT / "extern"
CSHARP_INDEX = DATA / "csharp_index.json"
LUA_USAGE_INDEX = DATA / "lua_usage_index.json"
UNITY_USAGE_INDEX = DATA / "unity_main_scene_index.json"
RUNTIME_PROBE_INDEX = DATA / "runtime_probe_index.json"
LUA_USAGE_REPORT = ROOT / "analysis" / "lua_usage_stub_improvements.md"
UNITY_USAGE_REPORT = ROOT / "analysis" / "unity_main_scene_stub_improvements.md"
RUNTIME_PROBE_REPORT = ROOT / "analysis" / "runtime_probe_stub_improvements.md"
DOCUMENTATION_CLEANUP_REPORT = ROOT / "analysis" / "documentation_cleanup.md"
TYPE_CLEANUP_REPORT = ROOT / "analysis" / "type_cleanup.md"

LIBRARY_FILES = {
    "globals": "mdrg_globals.d.lua",
    "stdlib": "mdrg_stdlib.d.lua",
    "enums": "mdrg_enums.d.lua",
    "usage": "mdrg_usage.d.lua",
    "legacy": "mdrg_legacy_runtime_aliases.d.lua",
    "types": "mdrg_types.d.lua",
    "items": "mdrg_items.d.lua",
    "story": "mdrg_story.d.lua",
    "ui": "mdrg_ui.d.lua",
    "game": "mdrg_game.d.lua",
    "unity": "mdrg_unity.d.lua",
}

LUA_KEYWORDS = {
    "and",
    "break",
    "do",
    "else",
    "elseif",
    "end",
    "false",
    "for",
    "function",
    "goto",
    "if",
    "in",
    "local",
    "nil",
    "not",
    "or",
    "repeat",
    "return",
    "then",
    "true",
    "until",
    "while",
}

PRIMITIVE_TYPES = {
    "nil",
    "any",
    "boolean",
    "string",
    "number",
    "integer",
    "function",
    "table",
    "thread",
    "userdata",
    "lightuserdata",
}

SYSTEM_TYPE_MAP = {
    "Void": "nil",
    "System.Void": "nil",
    "String": "string",
    "System.String": "string",
    "Char": "string",
    "System.Char": "string",
    "Boolean": "boolean",
    "System.Boolean": "boolean",
    "Single": "number",
    "System.Single": "number",
    "Double": "number",
    "System.Double": "number",
    "Decimal": "number",
    "System.Decimal": "number",
    "Int16": "integer",
    "System.Int16": "integer",
    "Int32": "integer",
    "System.Int32": "integer",
    "Int64": "integer",
    "System.Int64": "integer",
    "UInt16": "integer",
    "System.UInt16": "integer",
    "UInt32": "integer",
    "System.UInt32": "integer",
    "UInt64": "integer",
    "System.UInt64": "integer",
    "Byte": "integer",
    "System.Byte": "integer",
    "SByte": "integer",
    "System.SByte": "integer",
    "Object": "any",
    "System.Object": "any",
    "Action": "fun()",
    "System.Action": "fun()",
    "Closure": "function",
    "MoonSharp.Interpreter.Closure": "function",
}

BUILTIN_GLOBAL_FUNCTIONS = {
    "ipairs",
    "pairs",
    "next",
    "type",
    "assert",
    "collectgarbage",
    "error",
    "tostring",
    "select",
    "tonumber",
    "print",
    "setmetatable",
    "getmetatable",
    "rawget",
    "rawset",
    "rawequal",
    "rawlen",
    "unpack",
    "pack",
    "pcall",
    "xpcall",
}

STATIC_FACTORY_CLASSES = {
    "GameId",
    "Guid",
    "Item",
    "ItemPrefab",
    "ShopManager",
    "ColorPalette",
    "SaveSlotData",
    "CookingSongRuntimeData",
}

CSHARP_PRIMITIVE_TYPE_MAP = {
    "void": "System.Void",
    "string": "System.String",
    "char": "System.Char",
    "bool": "System.Boolean",
    "float": "System.Single",
    "double": "System.Double",
    "decimal": "System.Decimal",
    "short": "System.Int16",
    "int": "System.Int32",
    "long": "System.Int64",
    "ushort": "System.UInt16",
    "uint": "System.UInt32",
    "ulong": "System.UInt64",
    "byte": "System.Byte",
    "sbyte": "System.SByte",
    "object": "System.Object",
}

CSHARP_PARAMETER_MODIFIERS = {"in", "out", "ref", "params", "this"}

CSHARP_MEMBER_MODIFIERS = {
    "abstract",
    "async",
    "extern",
    "internal",
    "new",
    "override",
    "partial",
    "private",
    "protected",
    "public",
    "readonly",
    "sealed",
    "static",
    "unsafe",
    "virtual",
}

TRIVIAL_CSHARP_PARENTS = {
    "Object",
    "object",
    "System.Object",
    "ValueType",
    "System.ValueType",
}


@dataclass
class GlobalEntry:
    name: str
    kind: str
    csharp_type: str | None = None


DOC_GLOBAL_VALUE_ALLOWLIST = {
    "CurrentModGuid",
}

DOC_GLOBAL_FUNCTION_ALLOWLIST: set[str] = set()

EXTRA_GLOBALS = [
    # Set by ModsSingleton.ModScriptWindow while executing a mod script.
    GlobalEntry("CurrentModGuid", "userdata", "System.Guid"),
]


@dataclass
class EnumInfo:
    original: str
    values: list[str]
    lua_name: str = ""


@dataclass
class FieldInfo:
    name: str
    type_raw: str
    accessor: str | None = None
    description: str | None = None
    deprecated: str | None = None


@dataclass
class MethodInfo:
    name: str
    return_raw: str
    params_raw: str
    is_constructor: bool = False
    docs_line: int | None = None


@dataclass(frozen=True)
class LuaParam:
    name: str
    typ: str
    optional: bool = False


@dataclass(frozen=True)
class CSharpDocInfo:
    description: str | None = None
    deprecated: str | None = None


@dataclass(frozen=True)
class CSharpMethodInfo:
    name: str
    is_static: bool
    params: tuple[str, ...]
    optional_params: tuple[bool, ...]
    return_type: str | None = None
    doc: CSharpDocInfo = field(default_factory=CSharpDocInfo)
    source: str = "dump"


@dataclass
class CSharpDocIndex:
    fields: dict[tuple[str, str], list[CSharpDocInfo]] = field(default_factory=lambda: defaultdict(list))


@dataclass(frozen=True)
class DocumentedDocEntry:
    description: str
    confidence: str
    evidence: tuple[str, ...] = ()
    docs_line: int | None = None


@dataclass
class DocumentedFunctionsIndex:
    class_docs: dict[str, DocumentedDocEntry] = field(default_factory=dict)
    method_docs_by_line: dict[tuple[str, str, int], DocumentedDocEntry] = field(default_factory=dict)
    method_docs_by_name: dict[tuple[str, str], DocumentedDocEntry] = field(default_factory=dict)
    imported_class_docs: int = 0
    imported_method_docs: int = 0
    ignored_empty: int = 0
    ignored_low_confidence: int = 0
    ignored_fallback: int = 0
    ignored_generic: int = 0
    ignored_name_pattern: int = 0
    ignored_misaligned: int = 0

    def class_description(self, class_name: str) -> str | None:
        entry = self.class_docs.get(class_name)
        return entry.description if entry else None

    def method_description(
        self,
        class_name: str,
        method_name: str,
        docs_lines: Iterable[int | None] = (),
    ) -> str | None:
        descriptions: list[str] = []
        for docs_line in docs_lines:
            if docs_line is None:
                continue
            entry = self.method_docs_by_line.get((class_name, method_name, docs_line))
            if entry and entry.description not in descriptions:
                descriptions.append(entry.description)
        if len(descriptions) == 1:
            return descriptions[0]
        if len(descriptions) > 1:
            return None

        entry = self.method_docs_by_name.get((class_name, method_name))
        return entry.description if entry else None


@dataclass
class ClassInfo:
    original: str
    inherits_raw: str
    members_raw: list[tuple[str, int]]
    lua_name: str = ""
    fields: list[FieldInfo] = field(default_factory=list)
    methods: list[MethodInfo] = field(default_factory=list)


EXTRA_CLASS_FIELDS = {
    "ItemPrefab": [
        FieldInfo(
            "ForbiddenSlots",
            "System.Collections.Generic.List`1[System.String]",
            deprecated="Deprecated C# member. Prefer SlotData.",
        ),
        FieldInfo(
            "OverrideIcon",
            "UnityEngine.Sprite",
            deprecated="Deprecated C# member. Prefer OverrideIconReference.",
        ),
        FieldInfo(
            "PossibleEquipmentSlots",
            "System.Collections.Generic.List`1[System.String]",
            deprecated="Deprecated C# member. Prefer AddRequiredSlot or SlotData.",
        ),
        FieldInfo(
            "RequiredSlots",
            "System.Collections.Generic.List`1[System.String]",
            deprecated="Deprecated C# member. Prefer AddRequiredSlot or SlotData.",
        ),
    ],
}

EXTRA_GLOBAL_DOCS = {
    "CurrentModGuid": "Guid of the mod whose Lua script window is currently executing. Set by ModsSingleton.ModScriptWindow before running mod Lua closures.",
}

EXTRA_CLASS_DOCS = {
    "Flowchart": "Fungus flowchart object exposed through the game API.",
    "BotStatusAppPopup": "Popup interno do BotStatusApp observado em scripts de Flowchart/Fungus extraidos da cena principal.",
    "BrowserPopup": "Browser interno do jogo observado em scripts de Flowchart/Fungus extraidos da cena principal.",
    "ColorPalette": "Colecao de cores configuraveis usada por slots de cor.",
    "ColorPaletteManager": "Acesso a paletas de cor registradas pelo jogo.",
    "ColorSlot": "Define um slot de cor editavel de item, normalmente associado a uma paleta.",
    "EdibleItemPrefabData": "Dados especificos de comida/consumivel associados a ItemPrefab.EdibleData.",
    "FishItemPrefabData": "Dados especificos de peixe associados a ItemPrefab.FishData.",
    "GameId": "Identificador de item ou recurso do jogo, incluindo itens vanilla e itens registrados por mods.",
    "GameUtilities": "Utilitarios gerais do jogo expostos ao Lua, incluindo transicoes de view, inventario e esperas para coroutine.",
    "GameVariables": "Estado global do jogo exposto para leitura, escrita e condicoes.",
    "Item": "Instancia runtime de um item no inventario/equipamento, usada em callbacks como OnUse e SpecialEffectAction.",
    "ItemModifiableVariableFactory": "Factory de variaveis modificaveis associadas a itens e condicoes de elementos visuais.",
    "ItemPrefab": "Modelo configuravel de item antes/depois do registro no jogo; scripts normalmente preenchem campos, anexam texturas/dados opcionais e registram o item via ModUtilities.",
    "ItemScopeCondition": "Base de condicoes de escopo de item usadas por requisitos e elementos dependentes de variaveis.",
    "ItemScopeConditionSpecialVariable": "Condicao de escopo de item baseada em variavel especial/modificavel.",
    "LuaEnvironment": "Fungus LuaEnvironment used by flowcharts and the mod loader. docs.txt exposes the type but not its Lua-callable members.",
    "LuaPersonalityModuleDefinition": "Definicao Lua de personality module; agrupa containers de dialogo e depois e ligada a um item registrado.",
    "LuaStoryCondition": "StoryCondition backed by Lua source code compiled to a MoonSharp closure.",
    "Mod": "Loaded mod package managed by ModsSingleton. docs.txt references this type but does not expose its members.",
    "ModUtilities": "Global helper exposed to mod Lua scripts for mod assets, item registration, localization, controllers, and MoonSharp coroutine helpers.",
    "MoonSharpInfo": "MoonSharp runtime information table exposed as _MOONSHARP.",
    "SlotEquipData": "Dados modernos de equipamento/slot para ItemPrefab, incluindo slots possiveis, obrigatorios e proibidos.",
    "StoryBotDialogueBranch": "Ramo de dialogo do bot usado por personality modules e containers de fala.",
    "StoryBotDialogueBranchContainer": "Container de ramos de dialogo associados a um identificador de fala/evento.",
    "StoryCondition": "Base de condicoes usadas pelo sistema de historia/eventos para verificar requisitos e combinar regras.",
    "SusModifier": "Modificador de cobertura/suspeita associado a areas visuais de um item.",
    "TextureOverriderManager": "Gerenciador de override/restauracao de sprites/texturas por alvo visual, usado por efeitos de item e room overrides.",
    "UiOverlay": "Utilitarios de overlay e popups de UI expostos ao Lua.",
    "WaitForSeconds": "Unity yield instruction commonly returned from Lua coroutines to wait for a number of seconds.",
}

EXTRA_FIELD_DOCS = {
    ("Flowchart", "LuaEnv"): "Fungus Lua environment attached to this flowchart.",
    ("LuaStoryCondition", "ValidClosure"): "True when the condition code has a generated MoonSharp closure.",
}

EXTRA_METHOD_DOCS = {
    ("AtLeastOneBoolVariableTrueRequirement", "CreateInstance"): "Cria uma regra que exige ao menos uma das variaveis booleanas indicadas ativa.",
    ("ColorPaletteManager", "GetColorPaletteByName"): "Busca uma paleta de cores pelo nome usado nos scripts gerados.",
    ("ColorSlot", "CreateInstance"): "Cria um slot de cor configuravel usando um nome exibido e uma paleta.",
    ("EdibleItemPrefabData", "CreateInstance"): "Cria dados de item comestivel; o callback preenche o perfil nutricional do item.",
    ("GameUtilities", "WaitForSecondsYield"): "Creates a WaitForSeconds yield instruction for coroutine delays.",
    ("Item", "GetCount"): "Retorna a quantidade empilhada da instancia runtime do item.",
    ("Item", "GetItemPrefab"): "Retorna o ItemPrefab associado a esta instancia runtime do item.",
    ("Item", "GetMainColorFromAdditionalData"): "Le a cor principal armazenada nos dados adicionais da instancia do item.",
    ("Item", "GetUniqueGuid"): "Retorna o Guid unico da instancia runtime do item.",
    ("Item", "IsEquipped"): "Retorna se a instancia runtime do item esta equipada.",
    ("Item", "SetColorIntoAdditionalData"): "Grava uma cor em um slot dos dados adicionais da instancia do item.",
    ("ItemModifiableVariableFactory", "CreateInstanceBoolBackedVariable"): "Cria uma variavel booleana modificavel usada por condicoes de elementos/texturas.",
    ("ItemModifiableVariableFactory", "CreateInstanceFloatVariable"): "Cria uma variavel numerica modificavel usada por sliders e ajustes visuais.",
    ("ItemPrefab", "AddAtLeastOneEnabledAllModifiableVariablesRequirement"): "Adiciona requisito para que pelo menos uma variavel modificavel do item esteja habilitada.",
    ("ItemPrefab", "AddAtLeastOneEnabledModifiableVariablesRequirement"): "Adiciona requisito para que pelo menos uma das variaveis modificaveis indicadas esteja habilitada.",
    ("ItemPrefab", "AddBoolModifiableVariable"): "Adiciona uma variavel modificavel booleana ao prefab.",
    ("ItemPrefab", "AddFloatModifiableVariable"): "Adiciona uma variavel modificavel numerica ao prefab.",
    ("ItemPrefab", "AddHoodieLogoTexture"): "Adiciona uma textura de logo modificavel para hoodie/roupa compativel.",
    ("ItemPrefab", "AddItemModifiableVariablesRequirement"): "Adiciona um requisito baseado nas variaveis modificaveis do item.",
    ("ItemPrefab", "AddModdableLogos"): "Adiciona configuracoes de logos modificaveis ao prefab.",
    ("ItemPrefab", "AddTexture"): "Anexa uma textura empacotada ao prefab; o overload com controller limita a textura a uma cena/controller.",
    ("ItemPrefab", "MakePair"): "Marca dois itens como par/conjunto relacionado.",
    ("ItemPrefab", "MakeSet"): "Marca ou cria associacao de conjunto entre itens relacionados.",
    ("ItemPrefab", "TurnIntoPersonalityModule"): "Liga um item registrado a uma definicao de personality module.",
    ("ItemScopeConditionSpecialVariable", "CreateInstance"): "Cria uma condicao baseada no nome de uma variavel modificavel do item.",
    ("LuaPersonalityModuleDefinition", "PrepareContainer"): "Retorna ou prepara um container de dialogo identificado por tag/stage.",
    ("LuaStoryCondition", "GenerateClosure"): "Generates the MoonSharp closure used by this Lua story condition.",
    ("LuaStoryCondition", "GenerateClosureUnsafe"): "Low-level closure generation entrypoint for this Lua story condition.",
    ("LuaStoryCondition", "GenerateCode"): "Returns the Lua condition source represented by this story condition.",
    ("LuaStoryCondition", "Explain"): "Returns a human-readable explanation for this story condition.",
    ("ModUtilities", "AddGenericItemToShop"): "Adiciona um item registrado a uma loja como item generico/recompravel.",
    ("ModUtilities", "AddSingleBuyItemToShop"): "Adiciona um item registrado a uma loja como compra unica.",
    ("ModUtilities", "CreateItemPrefab"): "Cria um ItemPrefab vazio para ser preenchido por script antes do registro do item.",
    ("ModUtilities", "CreateNewItem"): "Registra um ItemPrefab para um mod e retorna o GameId do item registrado.",
    ("ModUtilities", "CreateNewItemAutoAssignId"): "Registra um ItemPrefab para o mod e retorna o GameId gerado para lojas e referencias.",
    ("ModUtilities", "GetAsSprite"): "Cria uma referencia de Sprite convertida a partir de uma textura do pacote do mod.",
    ("ModUtilities", "GetController"): "Retorna um controller/cena pelo identificador textual usado em texturas e overrides.",
    ("ModUtilities", "GetModFile"): "Retorna um arquivo do pacote do mod pelo Guid do mod e caminho interno.",
    ("ModUtilities", "GetPackedTexture"): "Carrega uma textura empacotada do mod usando CurrentModGuid e o caminho interno do asset.",
    ("ModUtilities", "GetSprite"): "Carrega uma Sprite a partir de um asset do pacote do mod.",
    ("ModUtilities", "GetSpriteReference"): "Cria uma referencia automatica para uma Sprite do pacote do mod.",
    ("ModUtilities", "GetTexture"): "Carrega uma Texture2D do pacote do mod.",
    ("ModUtilities", "GetTextureReference"): "Cria uma referencia automatica para uma Texture2D do pacote do mod.",
    ("ModUtilities", "PrepareNewPersonalityDefinition"): "Cria uma definicao de personality module para receber containers e branches de dialogo.",
    ("ModUtilities", "StartCoroutine"): "Starts a managed coroutine from a MoonSharp closure. The optional callback runs when the coroutine finishes.",
    ("ModUtilities", "StopCoroutine"): "Stops a managed coroutine returned by StartCoroutine.",
    ("ModUtilities", "WaitForSeconds"): "Creates a WaitForSeconds yield instruction for use inside a MoonSharp coroutine.",
    ("SimpleLocalizedString", "CreateInstanceReplacement"): "Cria um texto localizado simples a partir de uma string literal exibida ao jogador.",
    ("SlotEquipData", "CreateInstance"): "Cria dados de slot/equipamento; quando informado, define o slot alvo do item.",
    ("SlotEquipData", "SetForbiddenSlotsString"): "Define os slots incompativeis ou proibidos para este equipamento.",
    ("SlotEquipData", "SetRequiredSlotsString"): "Define os slots que precisam estar presentes ou compativeis para este equipamento.",
    ("StoryBotDialogueBranch", "__new"): "Cria uma branch de dialogo; scripts gerados usam o overload com texto, Guid do mod e indice local.",
    ("StoryBotDialogueBranchContainer", "AddBranch"): "Adiciona uma branch de dialogo ao container e retorna o container para encadeamento.",
    ("StoryCondition", "And"): "Combina condicoes e exige que todas sejam verdadeiras.",
    ("StoryCondition", "Delegate"): "Cria uma condicao de historia avaliada por callback booleano.",
    ("StoryCondition", "Lua"): "Creates a StoryCondition from Lua condition code. The code is compiled to a MoonSharp closure by LuaStoryCondition.",
    ("StoryCondition", "NotAnd"): "Combina condicoes com negacao do resultado de And.",
    ("StoryCondition", "NotOr"): "Combina condicoes com negacao do resultado de Or.",
    ("StoryCondition", "Or"): "Combina condicoes e exige que pelo menos uma seja verdadeira.",
    ("TextureOverriderManager", "GetSpecialEffectsAction"): "Cria um callback compativel com SpecialEffectAction para aplicar/restaurar sprite de alvo visual.",
    ("TextureOverriderManager", "RestoreSprite"): "Restaura o sprite original de um alvo visual previamente alterado.",
    ("TextureOverriderManager", "SetSprite"): "Aplica override de sprite em um alvo visual, opcionalmente escopado por Guid unico.",
    ("UiOverlay", "CloseUiOverlay"): "Fecha o overlay de UI atualmente aberto.",
    ("UiOverlay", "OpenFungusOverlay"): "Opens the game's Fungus overlay.",
    ("UiOverlay", "HasFungusOverlay"): "Returns whether the Fungus overlay is currently open.",
    ("UiOverlay", "CloseFungusOverlay"): "Closes the game's Fungus overlay.",
    ("UiOverlay", "OkPopup"): "Mostra um popup simples com titulo, texto e acao opcional de OK.",
}


DOCUMENTED_DOCS = DocumentedFunctionsIndex()
LUA_USAGE = LuaUsageIndex()
UNITY_USAGE = UnityUsageIndex()
RUNTIME_PROBE: dict = {}
TYPE_RETURN_REFINEMENTS: list[str] = []
TYPE_ANY_ARRAY_RETURNS_RETAINED: set[str] = set()


def is_ident(name: str) -> bool:
    return re.match(r"^[A-Za-z_][A-Za-z0-9_]*$", name) is not None and name not in LUA_KEYWORDS


def sanitize_ident(name: str, fallback: str = "value") -> str:
    name = re.sub(r"\W", "_", name.strip())
    if not name:
        name = fallback
    if re.match(r"^\d", name):
        name = "_" + name
    if name in LUA_KEYWORDS:
        name += "_"
    return name


def strip_arity(name: str) -> str:
    return re.sub(r"`\d+", "", name)


def split_generic_args(text: str) -> list[str]:
    args: list[str] = []
    buf: list[str] = []
    depth = 0
    for ch in text:
        if ch == "[":
            depth += 1
            buf.append(ch)
        elif ch == "]":
            depth -= 1
            buf.append(ch)
        elif ch == "," and depth == 0:
            arg = "".join(buf).strip()
            if arg:
                args.append(arg)
            buf = []
        else:
            buf.append(ch)
    arg = "".join(buf).strip()
    if arg:
        args.append(arg)
    return args


def remove_assembly_details(name: str) -> str:
    name = name.strip()
    if name.startswith("[[") and name.endswith("]]"):
        inner = name[2:-2]
        depth = 0
        for i, ch in enumerate(inner):
            if ch == "[":
                depth += 1
            elif ch == "]":
                depth -= 1
            elif ch == "," and depth == 0:
                return inner[:i].strip()
        return inner.strip()
    return name


def simple_candidate(original: str) -> str:
    name = remove_assembly_details(original)
    name = strip_arity(name)
    name = re.sub(r"\[[^\]]*\]$", "", name)
    name = name.replace("+", ".")
    name = name.split(".")[-1]
    return sanitize_ident(name, "Type")


def qualified_candidate(original: str) -> str:
    name = remove_assembly_details(original)
    name = strip_arity(name)
    name = re.sub(r"\[[^\]]*\]$", "", name)
    name = name.replace("+", "_").replace(".", "_")
    parts = [p for p in name.split("_") if p]
    if len(parts) > 3:
        parts = parts[-3:]
    return sanitize_ident("_".join(parts), "Type")


def parse_docs() -> tuple[list[GlobalEntry], dict[str, EnumInfo], dict[str, ClassInfo]]:
    lines = DOCS.read_text(encoding="utf-8").splitlines()
    globals_: list[GlobalEntry] = []
    enums: dict[str, EnumInfo] = {}
    classes: dict[str, ClassInfo] = {}

    in_globals = True
    for line in lines:
        if line.startswith("-------------------"):
            in_globals = False
            break
        m = re.match(r'^"([^"]+)" - \(Userdata Type:(.+)\)\(UserData\)', line)
        if m:
            globals_.append(GlobalEntry(m.group(1), "userdata", m.group(2).strip()))
            continue
        m = re.match(r'^"([^"]+)" - \(Function', line)
        if m:
            globals_.append(GlobalEntry(m.group(1), "function"))
            continue
        m = re.match(r'^"([^"]+)" - \[', line)
        if m:
            globals_.append(GlobalEntry(m.group(1), "table"))
            continue
        m = re.match(r'^"(_G|_VERSION|_MOONSHARP)" - ', line)
        if m:
            globals_.append(GlobalEntry(m.group(1), "special"))

    i = 0
    while i < len(lines):
        line = lines[i].rstrip()
        enum_match = re.match(r"^Enum: (.+)$", line)
        if enum_match:
            original = enum_match.group(1).strip()
            values: list[str] = []
            j = i + 1
            if j < len(lines) and lines[j].strip() == "Enum values:":
                j += 1
            while j < len(lines) and lines[j].strip():
                values.append(lines[j].strip())
                j += 1
            enums[original] = EnumInfo(original, values)
            i = j
            continue

        class_match = re.match(r"^(.+?) inherits from (.+)$", line)
        if class_match and i + 1 < len(lines) and lines[i + 1].strip() == "Defined members:":
            original = class_match.group(1).strip()
            inherits = class_match.group(2).strip()
            members: list[tuple[str, int]] = []
            j = i + 2
            while j < len(lines) and lines[j].strip():
                members.append((lines[j].strip(), j + 1))
                j += 1
            classes[original] = ClassInfo(original, inherits, members)
            i = j
            continue
        i += 1

    return globals_, enums, classes


def luadoc_description_from_block(block: list[str]) -> str | None:
    for line in block:
        if line.startswith("---") and not line.startswith("---@"):
            description = line[3:].strip()
            if description:
                return description
    return None


def function_owner_from_block(block: list[str]) -> tuple[str, str] | None:
    for line in block:
        match = re.match(r"^function\s+([A-Za-z_][A-Za-z0-9_]*)[.:]([A-Za-z_][A-Za-z0-9_]*)\(", line.strip())
        if match:
            return match.group(1), match.group(2)
    return None


def collect_lua_block(lines: list[str], index: int) -> tuple[list[str], int]:
    while index < len(lines) and lines[index].strip() != "```lua":
        index += 1
    if index >= len(lines):
        return [], index
    index += 1
    block: list[str] = []
    while index < len(lines) and lines[index].strip() != "```":
        block.append(lines[index])
        index += 1
    if index < len(lines):
        index += 1
    return block, index


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


def documented_description_rejection_reason(
    confidence: str | None,
    description: str | None,
    evidence: Iterable[str] = (),
) -> str | None:
    if confidence not in {"high", "medium"}:
        return "low"
    if not description:
        return "empty"
    if any(pattern.search(description) for pattern in GENERIC_DOCUMENTATION_PATTERNS):
        return "generic"
    evidence_set = set(evidence)
    if "fallback" in evidence_set:
        return "fallback"
    if "name-pattern" in evidence_set and not (evidence_set & STRONG_DOCUMENTED_EVIDENCE):
        return "name-pattern"
    return None


def documented_description_allowed(
    confidence: str | None,
    description: str | None,
    evidence: Iterable[str] = (),
) -> tuple[bool, str | None]:
    reason = documented_description_rejection_reason(confidence, description, evidence)
    if reason:
        return False, reason
    return True, None


def record_documented_rejection(index: DocumentedFunctionsIndex, reason: str | None) -> None:
    if reason in {"low", "low-confidence"}:
        index.ignored_low_confidence += 1
    elif reason == "empty":
        index.ignored_empty += 1
    elif reason == "fallback":
        index.ignored_fallback += 1
    elif reason == "generic":
        index.ignored_generic += 1
    elif reason == "name-pattern":
        index.ignored_name_pattern += 1


def documented_method_matches_docs_line(method_name: str, docs_line_text: str) -> bool:
    return method_name in docs_line_text


def parse_documented_functions(path: Path, docs_lines: list[str]) -> DocumentedFunctionsIndex:
    index = DocumentedFunctionsIndex()
    if not path.exists():
        return index

    lines = path.read_text(encoding="utf-8", errors="replace").splitlines()
    name_candidates: dict[tuple[str, str], list[DocumentedDocEntry]] = defaultdict(list)

    current_class: str | None = None
    class_confidence: str | None = None
    class_evidence: tuple[str, ...] = ()
    class_omitted_reason: str | None = None
    current_method: str | None = None
    method_docs_line: int | None = None
    method_confidence: str | None = None
    method_evidence: tuple[str, ...] = ()
    method_omitted_reason: str | None = None

    i = 0
    while i < len(lines):
        line = lines[i]
        section_match = re.match(r"^## (?!Generation summary)(.+)$", line)
        if section_match:
            current_class = section_match.group(1).strip()
            class_confidence = None
            class_evidence = ()
            class_omitted_reason = None
            current_method = None
            method_docs_line = None
            method_confidence = None
            method_evidence = ()
            method_omitted_reason = None
            i += 1
            continue

        class_confidence_match = re.match(r"^- Class confidence: `([^`]+)`", line)
        if class_confidence_match:
            class_confidence = class_confidence_match.group(1)
            i += 1
            continue

        class_evidence_match = re.match(r"^- Class evidence: `([^`]+)`", line)
        if class_evidence_match:
            class_evidence = tuple(part.strip() for part in class_evidence_match.group(1).split(",") if part.strip())
            i += 1
            continue

        omitted_match = re.match(r"^- LuaDoc omitted: `([^`]+)`", line)
        if omitted_match:
            if current_method:
                method_omitted_reason = omitted_match.group(1)
            else:
                class_omitted_reason = omitted_match.group(1)
            i += 1
            continue

        if line.strip() == "- Class motivation:" and current_class:
            local_omitted_reason = class_omitted_reason
            lookahead = i + 1
            while lookahead < len(lines) and lines[lookahead].strip() != "```lua":
                omitted_match = re.match(r"^- LuaDoc omitted: `([^`]+)`", lines[lookahead])
                if omitted_match:
                    local_omitted_reason = omitted_match.group(1)
                    break
                lookahead += 1
            block, i = collect_lua_block(lines, i + 1)
            description = luadoc_description_from_block(block)
            allowed, reason = documented_description_allowed(class_confidence, description, class_evidence)
            if allowed and description:
                index.class_docs[current_class] = DocumentedDocEntry(description, class_confidence or "", docs_line=None)
                index.imported_class_docs += 1
            else:
                record_documented_rejection(index, local_omitted_reason or reason)
            class_omitted_reason = None
            continue

        method_match = re.match(r"^### `([^`]+)`", line)
        if method_match:
            current_method = method_match.group(1)
            method_docs_line = None
            method_confidence = None
            method_evidence = ()
            method_omitted_reason = None
            i += 1
            continue

        source_match = re.match(r"^- Source: `docs\.txt:(\d+)`", line)
        if source_match:
            method_docs_line = int(source_match.group(1))
            i += 1
            continue

        confidence_match = re.match(r"^- Confidence: `([^`]+)`", line)
        if confidence_match:
            method_confidence = confidence_match.group(1)
            i += 1
            continue

        evidence_match = re.match(r"^- Evidence: `([^`]+)`", line)
        if evidence_match:
            method_evidence = tuple(part.strip() for part in evidence_match.group(1).split(",") if part.strip())
            i += 1
            continue

        if line.strip() == "```lua" and current_class and current_method:
            block, i = collect_lua_block(lines, i)
            description = luadoc_description_from_block(block)
            owner_method = function_owner_from_block(block)
            owner = owner_method[0] if owner_method else current_class
            method_name = owner_method[1] if owner_method else current_method

            allowed, reason = documented_description_allowed(method_confidence, description, method_evidence)
            if not allowed:
                record_documented_rejection(index, method_omitted_reason or reason)
                current_method = None
                method_omitted_reason = None
                continue

            if (
                method_docs_line is None
                or method_docs_line < 1
                or method_docs_line > len(docs_lines)
                or not documented_method_matches_docs_line(current_method, docs_lines[method_docs_line - 1])
            ):
                index.ignored_misaligned += 1
                current_method = None
                continue

            entry = DocumentedDocEntry(
                description=description or "",
                confidence=method_confidence or "",
                evidence=method_evidence,
                docs_line=method_docs_line,
            )
            keys = {(current_class, current_method, method_docs_line), (owner, method_name, method_docs_line)}
            for key in keys:
                index.method_docs_by_line[key] = entry
            name_candidates[(current_class, current_method)].append(entry)
            name_candidates[(owner, method_name)].append(entry)
            index.imported_method_docs += 1
            current_method = None
            method_omitted_reason = None
            continue

        i += 1

    for key, entries in name_candidates.items():
        by_description: dict[str, DocumentedDocEntry] = {}
        for entry in entries:
            by_description.setdefault(entry.description, entry)
        if len(by_description) == 1:
            index.method_docs_by_name[key] = next(iter(by_description.values()))

    return index


def assign_lua_names(globals_: list[GlobalEntry], enums: dict[str, EnumInfo], classes: dict[str, ClassInfo]) -> dict[str, str]:
    originals = list(classes.keys()) + list(enums.keys())
    exact_global_names: dict[str, str] = {}
    for entry in globals_:
        if entry.kind != "userdata" or not entry.csharp_type:
            continue
        if not is_ident(entry.name):
            continue
        if entry.name == simple_candidate(entry.csharp_type):
            exact_global_names[entry.csharp_type] = entry.name

    prelim: dict[str, str] = {}
    for original in originals:
        prelim[original] = exact_global_names.get(original, simple_candidate(original))

    by_candidate: dict[str, list[str]] = defaultdict(list)
    for original, candidate in prelim.items():
        by_candidate[candidate].append(original)

    final: dict[str, str] = {}
    used: set[str] = set()
    for candidate, values in sorted(by_candidate.items()):
        if len(values) == 1:
            name = candidate
            if name in used:
                name = make_unique(name, used)
            final[values[0]] = name
            used.add(name)
            continue

        preferred = [v for v in values if exact_global_names.get(v) == candidate]
        if len(preferred) == 1 and candidate not in used:
            final[preferred[0]] = candidate
            used.add(candidate)
            values = [v for v in values if v != preferred[0]]

        for original in values:
            name = qualified_candidate(original)
            name = make_unique(name, used)
            final[original] = name
            used.add(name)

    for original, info in classes.items():
        info.lua_name = final[original]
    for original, info in enums.items():
        info.lua_name = final[original]
    return final


def make_unique(name: str, used: set[str]) -> str:
    if name not in used:
        return name
    index = 2
    while f"{name}{index}" in used:
        index += 1
    return f"{name}{index}"


class TypeConverter:
    def __init__(self, name_map: dict[str, str], known_names: set[str]) -> None:
        self.name_map = name_map
        self.known_names = known_names
        self.unknown_names: set[str] = set()
        self.parent_by_final: dict[str, str] = {}
        self.nested_by_parent_short: dict[tuple[str, str], str] = {}

        self.simple_to_known: dict[str, str] = {}
        by_simple: dict[str, list[str]] = defaultdict(list)
        for original, final in name_map.items():
            by_simple[simple_candidate(original)].append(final)
            if "+" in original:
                parent_original = original.rsplit("+", 1)[0]
                parent_final = name_map.get(parent_original)
                if parent_final:
                    short = simple_candidate(original.rsplit("+", 1)[1])
                    self.parent_by_final[final] = parent_final
                    self.nested_by_parent_short[(parent_final, short)] = final
        for simple, values in by_simple.items():
            unique = sorted(set(values))
            if len(unique) == 1:
                self.simple_to_known[simple] = unique[0]

    def convert(self, raw: str, context: str | None = None) -> str:
        raw = remove_assembly_details(raw.strip())
        raw = raw.replace("&", "").strip()
        raw = raw.removeprefix("out ").strip()
        if not raw:
            return "any"

        if raw in SYSTEM_TYPE_MAP:
            return SYSTEM_TYPE_MAP[raw]

        if raw.endswith("[]"):
            inner = self.convert(raw[:-2], context)
            if "|" in inner and not inner.endswith(")"):
                inner = f"({inner})"
            return f"{inner}[]"

        generic = self._split_generic(raw)
        if generic:
            base, args = generic
            return self._convert_generic(base, args, context)

        if re.search(r"`\d+$", raw):
            base = strip_arity(raw)
            simple = simple_candidate(base)
            if simple in {"Action", "Func", "Predicate"}:
                return "function"
            if "Enumerable" in base or "Collection" in base or "List" in base:
                return "any[]"
            if "Dictionary" in base:
                return "table<any, any>"
            if simple in self.simple_to_known:
                return self.simple_to_known[simple]
            return self._unknown(simple)

        if raw in self.name_map:
            return self.name_map[raw]

        simple = simple_candidate(raw)
        if simple in SYSTEM_TYPE_MAP:
            return SYSTEM_TYPE_MAP[simple]
        nested = self._lookup_nested(context, simple)
        if nested:
            return nested
        if simple in self.simple_to_known:
            return self.simple_to_known[simple]
        return self._unknown(simple)

    def _split_generic(self, raw: str) -> tuple[str, list[str]] | None:
        start = raw.find("[")
        if start == -1 or not raw.endswith("]"):
            return None
        base = raw[:start]
        args = split_generic_args(raw[start + 1 : -1])
        return base, args

    def _convert_generic(self, base_raw: str, args_raw: list[str], context: str | None = None) -> str:
        base = strip_arity(remove_assembly_details(base_raw.strip()))
        base_simple = simple_candidate(base)
        base_lower = base.lower()
        args = [self.convert(arg, context) for arg in args_raw]

        if base in {"System.Nullable", "Nullable"} or base_simple == "Nullable":
            return f"{args[0] if args else 'any'}|nil"

        if base_simple in {"Func", "Predicate"} or base.endswith(".Func"):
            if base_simple == "Predicate":
                params = args
                ret = "boolean"
            else:
                params = args[:-1]
                ret = args[-1] if args else "any"
            param_text = ", ".join(f"arg{i + 1}: {typ}" for i, typ in enumerate(params))
            return f"fun({param_text}): {ret}" if param_text else f"fun(): {ret}"

        if base_simple == "Action" or base.endswith(".Action"):
            param_text = ", ".join(f"arg{i + 1}: {typ}" for i, typ in enumerate(args))
            return f"fun({param_text})" if param_text else "fun()"

        if "dictionary" in base_lower or "idictionary" in base_lower or "readonlydictionary" in base_lower:
            if "keycollection" in base_lower:
                return f"{args[0] if args else 'any'}[]"
            if "valuecollection" in base_lower:
                return f"{args[1] if len(args) > 1 else 'any'}[]"
            key = args[0] if args else "any"
            value = args[1] if len(args) > 1 else "any"
            return f"table<{key}, {value}>"

        if (
            "list" in base_lower
            or "ienumerable" in base_lower
            or "icollection" in base_lower
            or "ireadonlycollection" in base_lower
            or "readonlycollection" in base_lower
            or "ilist" in base_lower
            or "array" in base_lower
            or "span" in base_lower
        ):
            return f"{args[0] if args else 'any'}[]"

        if "tuple" in base_lower or "valuetuple" in base_lower or "keyvaluepair" in base_lower:
            return "table"

        if base_simple in self.simple_to_known:
            return self.simple_to_known[base_simple]
        return self._unknown(base_simple)

    def _lookup_nested(self, context: str | None, short: str) -> str | None:
        current = context
        while current:
            nested = self.nested_by_parent_short.get((current, short))
            if nested:
                return nested
            current = self.parent_by_final.get(current)
        return None

    def _unknown(self, name: str) -> str:
        name = sanitize_ident(name, "Unknown")
        if name not in PRIMITIVE_TYPES and name not in self.known_names:
            self.unknown_names.add(name)
        return name


def parse_members(classes: dict[str, ClassInfo]) -> None:
    for cls in classes.values():
        for member, docs_line in cls.members_raw:
            if member.startswith("__new("):
                cls.methods.append(MethodInfo("__new", cls.original, member[len("__new(") : -1], True, docs_line))
                continue

            method_match = re.match(r"^(.+?)\s+([A-Za-z_][A-Za-z0-9_]*)\((.*)\)$", member)
            if method_match:
                cls.methods.append(
                    MethodInfo(
                        method_match.group(2),
                        method_match.group(1).strip(),
                        method_match.group(3).strip(),
                        docs_line=docs_line,
                    )
                )
                continue

            prop_match = re.match(r"^(.+?)\s+([A-Za-z_][A-Za-z0-9_]*)\s+\{([^}]*)\}$", member)
            if prop_match:
                cls.fields.append(
                    FieldInfo(prop_match.group(2), prop_match.group(1).strip(), prop_match.group(3).strip())
                )
                continue

            field_match = re.match(r"^(.+?)\s+([A-Za-z_][A-Za-z0-9_]*)$", member)
            if field_match:
                field_type = field_match.group(1).strip()
                field_name = field_match.group(2)
                if "MoonSharp.Interpreter.Interop." in field_name or "." in field_name:
                    continue
                cls.fields.append(FieldInfo(field_name, field_type))


def add_extra_class_fields(classes: dict[str, ClassInfo]) -> None:
    for cls in classes.values():
        extras = EXTRA_CLASS_FIELDS.get(cls.lua_name) or EXTRA_CLASS_FIELDS.get(cls.original)
        if not extras:
            continue

        existing = {field.name for field in cls.fields}
        for extra in extras:
            if extra.name in existing:
                continue
            cls.fields.append(extra)
            existing.add(extra.name)


def apply_csharp_field_docs(classes: dict[str, ClassInfo], csharp_docs: CSharpDocIndex) -> None:
    for cls in classes.values():
        class_names = class_doc_names(cls)
        for field_info in cls.fields:
            docs: list[CSharpDocInfo] = []
            for class_name in class_names:
                docs.extend(csharp_docs.fields.get((class_name, field_info.name), []))
            merged = merge_doc_infos(docs)
            if not field_info.description:
                field_info.description = merged.description
            if field_info.deprecated is None:
                field_info.deprecated = merged.deprecated


def parse_params(params_raw: str, converter: TypeConverter, context: str | None = None) -> list[LuaParam]:
    if not params_raw:
        return []
    params: list[LuaParam] = []
    used: set[str] = set()
    for index, raw in enumerate(split_generic_args(params_raw)):
        if "__" in raw:
            name_raw, type_raw = raw.split("__", 1)
        else:
            name_raw, type_raw = f"arg{index + 1}", raw
        name = sanitize_ident(name_raw, f"arg{index + 1}")
        if name in used:
            base = name
            suffix = 2
            while f"{base}{suffix}" in used:
                suffix += 1
            name = f"{base}{suffix}"
        used.add(name)
        params.append(LuaParam(name, converter.convert(type_raw, context)))
    return params


def split_csharp_list(text: str) -> list[str]:
    args: list[str] = []
    buf: list[str] = []
    angle_depth = 0
    square_depth = 0
    paren_depth = 0
    for ch in text:
        if ch == "<":
            angle_depth += 1
            buf.append(ch)
        elif ch == ">":
            angle_depth = max(0, angle_depth - 1)
            buf.append(ch)
        elif ch == "[":
            square_depth += 1
            buf.append(ch)
        elif ch == "]":
            square_depth = max(0, square_depth - 1)
            buf.append(ch)
        elif ch == "(":
            paren_depth += 1
            buf.append(ch)
        elif ch == ")":
            paren_depth = max(0, paren_depth - 1)
            buf.append(ch)
        elif ch == "," and angle_depth == 0 and square_depth == 0 and paren_depth == 0:
            arg = "".join(buf).strip()
            if arg:
                args.append(arg)
            buf = []
        else:
            buf.append(ch)
    arg = "".join(buf).strip()
    if arg:
        args.append(arg)
    return args


def strip_csharp_default_value(text: str) -> str:
    buf: list[str] = []
    angle_depth = 0
    square_depth = 0
    paren_depth = 0
    for ch in text:
        if ch == "<":
            angle_depth += 1
        elif ch == ">":
            angle_depth = max(0, angle_depth - 1)
        elif ch == "[":
            square_depth += 1
        elif ch == "]":
            square_depth = max(0, square_depth - 1)
        elif ch == "(":
            paren_depth += 1
        elif ch == ")":
            paren_depth = max(0, paren_depth - 1)
        elif ch == "=" and angle_depth == 0 and square_depth == 0 and paren_depth == 0:
            break
        buf.append(ch)
    return "".join(buf).strip()


def csharp_param_has_default(text: str) -> bool:
    angle_depth = 0
    square_depth = 0
    paren_depth = 0
    for ch in text:
        if ch == "<":
            angle_depth += 1
        elif ch == ">":
            angle_depth = max(0, angle_depth - 1)
        elif ch == "[":
            square_depth += 1
        elif ch == "]":
            square_depth = max(0, square_depth - 1)
        elif ch == "(":
            paren_depth += 1
        elif ch == ")":
            paren_depth = max(0, paren_depth - 1)
        elif ch == "=" and angle_depth == 0 and square_depth == 0 and paren_depth == 0:
            return True
    return False


def split_csharp_generic(raw: str) -> tuple[str, list[str]] | None:
    raw = raw.strip()
    if not raw.endswith(">"):
        return None
    start = raw.find("<")
    if start == -1:
        return None
    base = raw[:start].strip()
    args = split_csharp_list(raw[start + 1 : -1])
    return base, args


def clean_csharp_type(raw: str) -> str:
    raw = raw.strip()
    raw = raw.replace("global::", "")
    raw = re.sub(r"\b(?:readonly\s+)?(in|out|ref|params|this)\s+", "", raw)
    raw = re.sub(r"^\s*\[[^\]]+\]\s*", "", raw)
    return raw.strip()


def csharp_param_type(raw: str) -> str:
    raw = clean_csharp_type(strip_csharp_default_value(raw))
    if not raw:
        return "object"
    parts = raw.split()
    while parts and parts[0] in CSHARP_PARAMETER_MODIFIERS:
        parts.pop(0)
    if len(parts) <= 1:
        return parts[0] if parts else "object"
    return " ".join(parts[:-1])


def csharp_type_to_lua(raw: str, converter: TypeConverter, context: str | None = None) -> str:
    raw = clean_csharp_type(raw)
    if not raw:
        return "any"

    nullable = False
    if raw.endswith("?") and not raw.endswith("[]?"):
        nullable = True
        raw = raw[:-1].strip()

    if raw in CSHARP_PRIMITIVE_TYPE_MAP:
        converted = converter.convert(CSHARP_PRIMITIVE_TYPE_MAP[raw], context)
        return f"{converted}|nil" if nullable and converted != "nil" else converted

    if raw.endswith("[]"):
        inner = csharp_type_to_lua(raw[:-2], converter, context)
        converted = f"{inner}[]"
        return f"{converted}|nil" if nullable else converted

    generic = split_csharp_generic(raw)
    if generic:
        base, args_raw = generic
        base_simple = simple_candidate(base)
        base_lower = base.lower()
        args = [csharp_type_to_lua(arg, converter, context) for arg in args_raw]

        if base_simple == "Nullable":
            return f"{args[0] if args else 'any'}|nil"
        if base_simple in {"Func", "Predicate"}:
            params = args if base_simple == "Predicate" else args[:-1]
            ret = "boolean" if base_simple == "Predicate" else (args[-1] if args else "any")
            param_text = ", ".join(f"arg{i + 1}: {typ}" for i, typ in enumerate(params))
            converted = f"fun({param_text}): {ret}" if param_text else f"fun(): {ret}"
            return f"{converted}|nil" if nullable else converted
        if base_simple == "Action":
            param_text = ", ".join(f"arg{i + 1}: {typ}" for i, typ in enumerate(args))
            converted = f"fun({param_text})" if param_text else "fun()"
            return f"{converted}|nil" if nullable else converted
        if "dictionary" in base_lower or "idictionary" in base_lower or "readonlydictionary" in base_lower:
            key = args[0] if args else "any"
            value = args[1] if len(args) > 1 else "any"
            converted = f"table<{key}, {value}>"
            return f"{converted}|nil" if nullable else converted
        if (
            "list" in base_lower
            or "ienumerable" in base_lower
            or "icollection" in base_lower
            or "ireadonlycollection" in base_lower
            or "readonlycollection" in base_lower
            or "ilist" in base_lower
            or "array" in base_lower
            or "span" in base_lower
        ):
            converted = f"{args[0] if args else 'any'}[]"
            return f"{converted}|nil" if nullable else converted
        if "tuple" in base_lower or "valuetuple" in base_lower or "keyvaluepair" in base_lower:
            return "table|nil" if nullable else "table"

    converted = converter.convert(CSHARP_PRIMITIVE_TYPE_MAP.get(raw, raw), context)
    return f"{converted}|nil" if nullable and converted != "nil" else converted


def csharp_return_simple_name(raw: str) -> str:
    raw = clean_csharp_type(raw)
    raw = raw.rstrip("?")
    if raw in CSHARP_PRIMITIVE_TYPE_MAP:
        raw = CSHARP_PRIMITIVE_TYPE_MAP[raw]
    raw = raw.split("<", 1)[0]
    raw = raw.removesuffix("[]")
    return simple_candidate(raw)


def csharp_base_simple_name(raw: str) -> str:
    raw = clean_csharp_type(raw)
    raw = raw.split("<", 1)[0]
    raw = raw.split("[", 1)[0]
    raw = strip_arity(raw)
    return simple_candidate(raw)


def clean_doc_text(text: str | None) -> str | None:
    if text is None:
        return None
    text = re.sub(r"\s+", " ", text.strip())
    return text or None


def first_csharp_string_arg(args: str | None) -> str | None:
    if not args:
        return None
    match = re.search(r'"(?:\\.|[^"\\])*"', args)
    if not match:
        return None
    literal = match.group(0)
    try:
        value = json.loads(literal)
    except json.JSONDecodeError:
        value = literal[1:-1].replace(r"\"", '"').replace(r"\\", "\\")
    return clean_doc_text(value)


def parse_csharp_attribute(line: str) -> tuple[str, str | None] | None:
    match = re.match(r"^\s*\[(?P<name>[A-Za-z_][A-Za-z0-9_.]*)(?:\((?P<args>.*)\))?\]\s*$", line)
    if not match:
        return None
    return match.group("name").split(".")[-1], match.group("args")


def doc_from_attributes(
    attrs: list[tuple[str, str | None]],
    *,
    include_tooltip: bool,
    include_obsolete: bool,
) -> CSharpDocInfo:
    description: str | None = None
    deprecated: str | None = None
    for name, args in attrs:
        if include_tooltip and name == "Tooltip" and description is None:
            description = first_csharp_string_arg(args)
        if include_obsolete and name == "Obsolete" and deprecated is None:
            deprecated = first_csharp_string_arg(args) or ""
    return CSharpDocInfo(description, deprecated)


def merge_doc_infos(infos: list[CSharpDocInfo]) -> CSharpDocInfo:
    descriptions = {info.description for info in infos if info.description}
    deprecated = {info.deprecated for info in infos if info.deprecated is not None}
    description = next(iter(descriptions)) if len(descriptions) == 1 else None
    deprecated_text = next(iter(deprecated)) if len(deprecated) == 1 else None
    return CSharpDocInfo(description, deprecated_text)


def class_doc_names(cls: ClassInfo) -> set[str]:
    names = {cls.lua_name, simple_candidate(cls.original)}
    if "+" in cls.original:
        names.add(simple_candidate(cls.original.rsplit("+", 1)[1]))
    return names


def build_csharp_doc_index() -> CSharpDocIndex:
    index = CSharpDocIndex()
    if not DUMP.exists():
        return index

    modifier_pattern = "|".join(sorted(CSHARP_MEMBER_MODIFIERS))
    class_decl = re.compile(r"\b(?:class|struct|interface)\s+([A-Za-z_][A-Za-z0-9_]*)(?:`\d+)?\b")
    member_decl = re.compile(
        rf"^\s*(?P<mods>(?:(?:{modifier_pattern})\s+)+)"
        rf"(?P<type>.+?)\s+"
        rf"(?P<name>[A-Za-z_][A-Za-z0-9_]*)\s*(?:[;{{}}]|$)"
    )

    for path in DUMP.rglob("*.cs"):
        lines = path.read_text(encoding="utf-8", errors="ignore").splitlines()
        stack: list[tuple[str, int]] = []
        pending_class: str | None = None
        pending_attrs: list[tuple[str, str | None]] = []
        brace_depth = 0

        for line in lines:
            attr = parse_csharp_attribute(line)
            if attr:
                pending_attrs.append(attr)
                continue

            class_match = class_decl.search(line)
            if class_match:
                pending_class = class_match.group(1)
                pending_attrs = []
            if pending_class and "{" in line:
                stack.append((pending_class, brace_depth + 1))
                pending_class = None

            current_class = stack[-1][0] if stack else None
            if current_class and pending_attrs:
                member_match = member_decl.match(line)
                if member_match and "(" not in line:
                    modifiers = set(member_match.group("mods").split())
                    doc = doc_from_attributes(
                        pending_attrs,
                        include_tooltip="public" in modifiers,
                        include_obsolete=True,
                    )
                    if doc.description or doc.deprecated is not None:
                        index.fields[(current_class, member_match.group("name"))].append(doc)

            if line.strip():
                pending_attrs = []

            brace_depth += line.count("{") - line.count("}")
            while stack and brace_depth < stack[-1][1]:
                stack.pop()

    return index


def build_csharp_inheritance_index() -> dict[str, str]:
    if not DUMP.exists():
        return {}

    type_kinds: dict[str, str] = {}
    declarations: list[tuple[str, str, str]] = []
    type_decl = re.compile(
        r"^\s*(?:\[[^\]]+\]\s*)*"
        r"(?:public|internal)\s+"
        r"(?:(?:abstract|sealed|static|partial|unsafe|new)\s+)*"
        r"(?P<kind>class|struct|interface)\s+"
        r"(?P<name>[A-Za-z_][A-Za-z0-9_]*)(?:`\d+)?"
        r"(?:\s*:\s*(?P<bases>[^{}]+))?"
    )

    for path in DUMP.rglob("*.cs"):
        for line in path.read_text(encoding="utf-8", errors="ignore").splitlines():
            match = type_decl.match(line)
            if not match:
                continue
            kind = match.group("kind")
            name = match.group("name")
            bases = (match.group("bases") or "").strip()
            type_kinds[name] = kind
            declarations.append((kind, name, bases))

    parent_candidates: dict[str, set[str]] = defaultdict(set)
    for kind, name, bases in declarations:
        if kind != "class" or not bases:
            continue
        for raw_parent in split_csharp_list(bases):
            parent = raw_parent.strip()
            parent_simple = csharp_base_simple_name(parent)
            if (
                not parent_simple
                or parent_simple == name
                or parent_simple in TRIVIAL_CSHARP_PARENTS
                or type_kinds.get(parent_simple) == "interface"
            ):
                continue
            if parent_simple.startswith("I") and type_kinds.get(parent_simple) is None:
                continue
            parent_candidates[name].add(parent)
            break

    inheritance: dict[str, str] = {}
    for child, parents in parent_candidates.items():
        by_simple: dict[str, list[str]] = defaultdict(list)
        for parent in parents:
            by_simple[csharp_base_simple_name(parent)].append(parent)
        if len(by_simple) != 1:
            continue
        inheritance[child] = sorted(next(iter(by_simple.values())))[0]
    return inheritance


def build_csharp_method_index(converter: TypeConverter) -> dict[tuple[str, str], list[CSharpMethodInfo]]:
    index: dict[tuple[str, str], list[CSharpMethodInfo]] = defaultdict(list)
    source_roots = [root for root in (DUMP, RAWDUMP) if root.exists()]
    if not source_roots:
        return index

    unknown_names_snapshot = set(converter.unknown_names)
    modifier_pattern = "|".join(sorted(CSHARP_MEMBER_MODIFIERS))
    class_decl = re.compile(r"\b(?:class|struct|interface)\s+([A-Za-z_][A-Za-z0-9_]*)(?:`\d+)?\b")
    method_decl = re.compile(
        rf"^\s*(?:\[[^\]]+\]\s*)*"
        rf"(?P<mods>(?:(?:{modifier_pattern})\s+)+)"
        rf"(?P<return>.+?)\s+"
        rf"(?P<name>[A-Za-z_][A-Za-z0-9_]*)\s*"
        rf"\((?P<params>[^;{{}}]*)\)\s*(?:\{{|=>|\{{\s*\}}|$)"
    )

    for root in source_roots:
        source_name = root.name.lower()
        for path in root.rglob("*.cs"):
            lines = path.read_text(encoding="utf-8", errors="ignore").splitlines()
            stack: list[tuple[str, int]] = []
            pending_class: str | None = None
            pending_attrs: list[tuple[str, str | None]] = []
            brace_depth = 0

            for line in lines:
                attr = parse_csharp_attribute(line)
                if attr:
                    pending_attrs.append(attr)
                    continue

                class_match = class_decl.search(line)
                if class_match:
                    pending_class = class_match.group(1)
                    pending_attrs = []
                if pending_class and "{" in line:
                    stack.append((pending_class, brace_depth + 1))
                    pending_class = None

                current_class = stack[-1][0] if stack else None
                if current_class:
                    method_match = method_decl.match(line)
                    if method_match:
                        modifiers = set(method_match.group("mods").split())
                        if "public" in modifiers:
                            return_raw = method_match.group("return").strip()
                            if return_raw == "unsafe":
                                continue
                            method_name = method_match.group("name")
                            is_static = "static" in modifiers
                            raw_params = split_csharp_list(method_match.group("params"))
                            params = tuple(
                                csharp_type_to_lua(csharp_param_type(param), converter, current_class)
                                for param in raw_params
                            )
                            optional_params = tuple(csharp_param_has_default(param) for param in raw_params)
                            return_type = csharp_type_to_lua(return_raw, converter, current_class)
                            doc = doc_from_attributes(
                                pending_attrs,
                                include_tooltip=False,
                                include_obsolete=True,
                            )
                            info = CSharpMethodInfo(
                                method_name,
                                is_static,
                                params,
                                optional_params,
                                return_type,
                                doc,
                                source_name,
                            )
                            index[(current_class, method_name)].append(info)

                            if is_static and method_name in {"op_Implicit", "op_Explicit"}:
                                target_name = csharp_return_simple_name(method_match.group("return"))
                                index[(current_class, f"__to{target_name}")].append(
                                    CSharpMethodInfo(
                                        f"__to{target_name}",
                                        True,
                                        params,
                                        optional_params,
                                        return_type,
                                        doc,
                                        source_name,
                                    )
                                )

                if line.strip():
                    pending_attrs = []

                brace_depth += line.count("{") - line.count("}")
                while stack and brace_depth < stack[-1][1]:
                    stack.pop()

    converter.unknown_names = unknown_names_snapshot
    return index


def csharp_doc_info_to_data(doc: CSharpDocInfo) -> dict:
    return {
        "description": doc.description,
        "deprecated": doc.deprecated,
    }


def csharp_doc_info_from_data(data: dict | None) -> CSharpDocInfo:
    if not data:
        return CSharpDocInfo()
    return CSharpDocInfo(data.get("description"), data.get("deprecated"))


def csharp_indexes_to_data(
    csharp_docs: CSharpDocIndex,
    csharp_inheritance: dict[str, str],
    csharp_methods: dict[tuple[str, str], list[CSharpMethodInfo]],
) -> dict:
    fields = []
    for (class_name, field_name), docs in sorted(csharp_docs.fields.items()):
        for doc in docs:
            fields.append(
                {
                    "class": class_name,
                    "field": field_name,
                    "doc": csharp_doc_info_to_data(doc),
                }
            )

    methods = []
    for (class_name, method_name), infos in sorted(csharp_methods.items()):
        for info in infos:
            methods.append(
                {
                    "class": class_name,
                    "method": method_name,
                    "name": info.name,
                    "is_static": info.is_static,
                    "params": list(info.params),
                    "optional_params": list(info.optional_params),
                    "return_type": info.return_type,
                    "doc": csharp_doc_info_to_data(info.doc),
                    "source": info.source,
                }
            )

    return {
        "schema_version": 1,
        "fields": fields,
        "inheritance": {key: csharp_inheritance[key] for key in sorted(csharp_inheritance)},
        "methods": methods,
    }


def csharp_indexes_from_data(
    data: dict,
) -> tuple[CSharpDocIndex, dict[str, str], dict[tuple[str, str], list[CSharpMethodInfo]]]:
    csharp_docs = CSharpDocIndex()
    for entry in data.get("fields", []):
        csharp_docs.fields[(entry["class"], entry["field"])].append(csharp_doc_info_from_data(entry.get("doc")))

    csharp_inheritance = {
        str(child): str(parent)
        for child, parent in data.get("inheritance", {}).items()
    }

    csharp_methods: dict[tuple[str, str], list[CSharpMethodInfo]] = defaultdict(list)
    for entry in data.get("methods", []):
        class_name = entry["class"]
        method_name = entry["method"]
        csharp_methods[(class_name, method_name)].append(
            CSharpMethodInfo(
                entry.get("name", method_name),
                bool(entry.get("is_static", False)),
                tuple(entry.get("params", [])),
                tuple(bool(value) for value in entry.get("optional_params", [])),
                entry.get("return_type"),
                csharp_doc_info_from_data(entry.get("doc")),
                entry.get("source", "dump"),
            )
        )

    return csharp_docs, csharp_inheritance, csharp_methods


def load_csharp_indexes(
    path: Path,
) -> tuple[CSharpDocIndex, dict[str, str], dict[tuple[str, str], list[CSharpMethodInfo]]] | None:
    if not path.exists():
        return None
    return csharp_indexes_from_data(json.loads(path.read_text(encoding="utf-8")))


def save_csharp_indexes(
    path: Path,
    csharp_docs: CSharpDocIndex,
    csharp_inheritance: dict[str, str],
    csharp_methods: dict[tuple[str, str], list[CSharpMethodInfo]],
) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(
        json.dumps(
            csharp_indexes_to_data(csharp_docs, csharp_inheritance, csharp_methods),
            indent=2,
            ensure_ascii=False,
        )
        + "\n",
        encoding="utf-8",
    )


def matching_csharp_candidates(
    dump_index: dict[tuple[str, str], list[CSharpMethodInfo]],
    cls: ClassInfo,
    method: MethodInfo,
    signature: LuaSignature,
    sources: set[str] | None = None,
) -> list[CSharpMethodInfo]:
    candidates: list[CSharpMethodInfo] = []
    class_names = {cls.lua_name, simple_candidate(cls.original)}
    if "+" in cls.original:
        class_names.add(simple_candidate(cls.original.rsplit("+", 1)[1]))
    for class_name in class_names:
        candidates.extend(dump_index.get((class_name, method.name), []))

    if sources is not None:
        candidates = [candidate for candidate in candidates if candidate.source in sources]

    if not candidates:
        return []

    signature_types = tuple(param.typ for param in signature.params)
    arity_matches = [candidate for candidate in candidates if len(candidate.params) == len(signature_types)]
    if arity_matches:
        candidates = arity_matches
        type_matches = [candidate for candidate in candidates if candidate.params == signature_types]
        if type_matches:
            candidates = type_matches

    return candidates


def dump_static_decision(
    dump_index: dict[tuple[str, str], list[CSharpMethodInfo]],
    cls: ClassInfo,
    method: MethodInfo,
    signature: LuaSignature,
) -> bool | None:
    candidates = matching_csharp_candidates(dump_index, cls, method, signature, sources={"dump"})
    if not candidates:
        return None

    decisions = {candidate.is_static for candidate in candidates}
    if len(decisions) == 1:
        return next(iter(decisions))
    return None


def apply_optional_params(
    dump_index: dict[tuple[str, str], list[CSharpMethodInfo]],
    cls: ClassInfo,
    method: MethodInfo,
    signature: LuaSignature,
) -> LuaSignature:
    candidates = matching_csharp_candidates(dump_index, cls, method, signature, sources={"dump"})
    optional_candidates = [candidate.optional_params for candidate in candidates if len(candidate.optional_params) == len(signature.params)]
    if not optional_candidates:
        return signature

    optional_params = tuple(any(flags[index] for flags in optional_candidates) for index in range(len(signature.params)))
    if not any(optional_params):
        return signature

    params = tuple(
        LuaParam(param.name, param.typ, param.optional or optional_params[index])
        for index, param in enumerate(signature.params)
    )
    return LuaSignature(params, signature.return_type)


def is_static_method_fallback(cls: ClassInfo, method: MethodInfo) -> bool:
    if method.is_constructor:
        return True
    if method.name == "CreateInstance":
        return True
    if method.name.startswith("op_"):
        return True
    if cls.lua_name in STATIC_FACTORY_CLASSES and (
        method.name.startswith("Create")
        or method.name.startswith("Parse")
        or method.name.startswith("TryParse")
        or method.name.startswith("From")
        or method.name.startswith("New")
        or method.name == "__toGameId"
    ):
        return True
    return False


def is_static_method(
    cls: ClassInfo,
    method: MethodInfo,
    signature: LuaSignature,
    dump_index: dict[tuple[str, str], list[CSharpMethodInfo]],
) -> bool:
    if method.is_constructor:
        return True
    dump_decision = dump_static_decision(dump_index, cls, method, signature)
    if dump_decision is not None:
        return dump_decision
    return is_static_method_fallback(cls, method)


def class_domain(name: str) -> str:
    item_tokens = [
        "Item",
        "Shop",
        "ColorSlot",
        "ColorPalette",
        "Sus",
        "AllowedModifier",
        "SlotEquip",
        "Fish",
        "Fishing",
        "Edible",
        "GameStat",
    ]
    story_tokens = ["Story", "Save", "GlobalFlag", "ManagedCoroutine", "SimpleLocalizedString"]
    ui_tokens = [
        "Ui",
        "UI",
        "Popup",
        "Button",
        "TextMesh",
        "TMP",
        "Tooltip",
        "Dragged",
        "FloatingText",
        "BotStatus",
        "Browser",
        "Annalie",
        "Clothier",
        "Nun",
        "Fisher",
        "Sheep",
        "CommonButton",
    ]
    unity_tokens = [
        "UnityEngine",
        "Vector",
        "Color",
        "Sprite",
        "Texture",
        "Shader",
        "AudioClip",
        "AudioSource",
        "Transform",
        "GameObject",
        "MonoBehaviour",
        "Behaviour",
        "Component",
        "ParticleSystem",
        "WaitForSeconds",
        "Camera",
        "RectTransform",
        "Material",
        "Fungus",
        "View",
        "Scene",
    ]
    game_tokens = [
        "Game",
        "Mod",
        "Sound",
        "Music",
        "Cooking",
        "Recipe",
        "Live2D",
        "Event",
        "Delivery",
        "News",
        "R",
        "DataGenerated",
        "TextureOverrider",
        "Result",
        "ViewSingleton",
        "Controller",
    ]

    if any(token in name for token in item_tokens):
        return "items"
    if any(token in name for token in story_tokens):
        return "story"
    if any(token in name for token in ui_tokens):
        return "ui"
    if any(token in name for token in unity_tokens):
        return "unity"
    if any(token in name for token in game_tokens):
        return "game"
    return "types"


def header() -> list[str]:
    return [
        "---@meta",
        "",
        "-- MDRG MoonSharp Lua API definitions for LuaLS.",
        "-- Generated from docs.txt and curated data/*.json.",
        "-- These files describe exposed types and signatures only; comments avoid undocumented runtime behavior.",
        "",
    ]


def emit_enums(enums: dict[str, EnumInfo]) -> list[str]:
    lines = header()
    for enum in sorted(enums.values(), key=lambda item: item.lua_name):
        lines.append(f"---@alias {enum.lua_name}")
        for value in enum.values:
            escaped = value.replace("\\", "\\\\").replace('"', '\\"')
            lines.append(f"---| '\"{escaped}\"'")
        table_name = f"{enum.lua_name}Table"
        lines.append("")
        lines.append(f"---@class {table_name}")
        for value in enum.values:
            if is_ident(value):
                lines.append(f"---@field {value}? {enum.lua_name}")
        lines.append(f"---@type {table_name}")
        lines.append(f"{enum.lua_name} = {{}}")
        lines.append("")
    return lines


@dataclass(frozen=True)
class LuaSignature:
    params: tuple[LuaParam, ...]
    return_type: str


@dataclass(frozen=True)
class MethodEmission:
    method: MethodInfo
    signature: LuaSignature
    is_static: bool


def append_doc_lines(lines: list[str], doc: CSharpDocInfo) -> None:
    if doc.description:
        lines.append(f"---{doc.description}")
    if doc.deprecated is not None:
        lines.append(f"---@deprecated {doc.deprecated}".rstrip())


def with_description(doc: CSharpDocInfo, description: str | None) -> CSharpDocInfo:
    if not description or doc.description:
        return doc
    return CSharpDocInfo(description, doc.deprecated)


def append_field_doc_lines(lines: list[str], field_info: FieldInfo) -> None:
    if field_info.description:
        lines.append(f"---{field_info.description}")
    if field_info.deprecated is not None:
        if field_info.deprecated:
            lines.append(f"---Deprecated: {field_info.deprecated}")
        else:
            lines.append("---Deprecated.")


def method_doc_info(
    dump_index: dict[tuple[str, str], list[CSharpMethodInfo]],
    cls: ClassInfo,
    emissions: list[MethodEmission],
) -> CSharpDocInfo:
    deprecated_values: set[str] = set()
    for emission in emissions:
        candidates = matching_csharp_candidates(
            dump_index,
            cls,
            emission.method,
            emission.signature,
            sources={"dump"},
        )
        if not candidates:
            return CSharpDocInfo()
        for candidate in candidates:
            if candidate.doc.deprecated is None:
                return CSharpDocInfo()
            deprecated_values.add(candidate.doc.deprecated)
    if len(deprecated_values) == 1:
        return CSharpDocInfo(deprecated=next(iter(deprecated_values)))
    return CSharpDocInfo()


def class_description(name: str) -> str | None:
    return (
        EXTRA_CLASS_DOCS.get(name)
        or LUA_USAGE.class_description(name)
        or UNITY_USAGE.class_description(name)
        or DOCUMENTED_DOCS.class_description(name)
    )


def field_description(class_name: str, field_name: str) -> str | None:
    return (
        EXTRA_FIELD_DOCS.get((class_name, field_name))
        or LUA_USAGE.field_description(class_name, field_name)
        or UNITY_USAGE.field_description(class_name, field_name)
    )


def method_description(
    class_name: str,
    method_name: str,
    docs_lines: Iterable[int | None] = (),
) -> str | None:
    return (
        EXTRA_METHOD_DOCS.get((class_name, method_name))
        or LUA_USAGE.method_description(class_name, method_name)
        or UNITY_USAGE.method_description(class_name, method_name)
        or DOCUMENTED_DOCS.method_description(
            class_name,
            method_name,
            docs_lines,
        )
    )


def usage_adjusted_signature(class_name: str, method_name: str, signature: LuaSignature) -> LuaSignature:
    params = tuple(
        LuaParam(
            param.name,
            LUA_USAGE.method_param_type(class_name, method_name, param.name)
            or UNITY_USAGE.method_param_type(class_name, method_name, param.name)
            or param.typ,
            param.optional,
        )
        for param in signature.params
    )
    return LuaSignature(params, signature.return_type)


VAGUE_RETURN_TYPES = {
    "any",
    "any[]",
    "table",
    "ReadOnlyCollection",
    "IReadOnlyCollection",
    "IReadOnlyList",
    "IEnumerable",
    "ICollection",
    "List",
    "Dictionary",
}


def is_vague_return_type(type_name: str) -> bool:
    return type_name in VAGUE_RETURN_TYPES


def is_safe_csharp_return_type(type_name: str | None) -> bool:
    if not type_name:
        return False
    if type_name in {"any", "nil", "unsafe"}:
        return False
    if type_name in VAGUE_RETURN_TYPES:
        return False
    return True


def csharp_adjusted_return_signature(
    dump_index: dict[tuple[str, str], list[CSharpMethodInfo]],
    cls: ClassInfo,
    method: MethodInfo,
    signature: LuaSignature,
) -> LuaSignature:
    if not is_vague_return_type(signature.return_type):
        return signature

    candidates = matching_csharp_candidates(dump_index, cls, method, signature)
    return_types = sorted(
        {
            candidate.return_type
            for candidate in candidates
            if is_safe_csharp_return_type(candidate.return_type)
        }
    )
    label = f"{cls.lua_name}.{method.name}"
    if len(return_types) != 1:
        if signature.return_type == "any[]":
            reason = "no unique C# return type" if return_types else "no C# return type"
            TYPE_ANY_ARRAY_RETURNS_RETAINED.add(f"{label}: {reason}")
        return signature

    refined_return = return_types[0]
    if refined_return == signature.return_type:
        return signature

    TYPE_RETURN_REFINEMENTS.append(f"{label}: {signature.return_type} -> {refined_return}")
    return LuaSignature(signature.params, refined_return)


def overload_annotation(signature: LuaSignature, self_type: str | None = None) -> str:
    params = list(signature.params)
    if self_type:
        params.insert(0, LuaParam("self", self_type))
    param_text = ", ".join(f"{param.name}: {param.typ}" for param in params)
    if signature.return_type == "nil":
        return f"---@overload fun({param_text})"
    return f"---@overload fun({param_text}): {signature.return_type}"


def normalize_overload_signature(signature: LuaSignature) -> LuaSignature:
    params = tuple(LuaParam(param.name, param.typ) for param in signature.params)
    return LuaSignature(params, signature.return_type)


def overload_signature_variants(signature: LuaSignature) -> list[LuaSignature]:
    variants = [normalize_overload_signature(signature)]
    cutoff = len(signature.params)
    while cutoff > 0 and signature.params[cutoff - 1].optional:
        cutoff -= 1
        params = tuple(LuaParam(param.name, param.typ) for param in signature.params[:cutoff])
        variants.append(LuaSignature(params, signature.return_type))
    return variants


def resolve_parent_type(raw_parent: str, child_name: str, converter: TypeConverter) -> str | None:
    parent_simple = csharp_base_simple_name(raw_parent)
    if parent_simple in TRIVIAL_CSHARP_PARENTS:
        return None
    parent = csharp_type_to_lua(raw_parent, converter, child_name)
    if (
        parent == child_name
        or parent in PRIMITIVE_TYPES
        or not is_ident(parent)
    ):
        return None
    return parent


def class_parent(
    cls: ClassInfo,
    converter: TypeConverter,
    csharp_inheritance: dict[str, str],
) -> str | None:
    for class_name in {cls.lua_name, simple_candidate(cls.original)}:
        raw_parent = csharp_inheritance.get(class_name)
        if not raw_parent:
            continue
        parent = resolve_parent_type(raw_parent, cls.lua_name, converter)
        if parent:
            return parent

    for raw_parent in split_generic_args(cls.inherits_raw):
        unknown_names_snapshot = set(converter.unknown_names)
        parent = converter.convert(raw_parent, cls.lua_name)
        converter.unknown_names = unknown_names_snapshot
        if parent == cls.lua_name:
            continue
        if parent not in converter.known_names:
            continue
        if not is_ident(parent):
            continue
        return parent
    return None


def emit_classes(
    classes: list[ClassInfo],
    converter: TypeConverter,
    dump_index: dict[tuple[str, str], list[CSharpMethodInfo]],
    csharp_inheritance: dict[str, str],
) -> list[str]:
    lines = header()
    for cls in sorted(classes, key=lambda item: item.lua_name):
        description = class_description(cls.lua_name)
        if description:
            lines.append(f"---{description}")
        parent = class_parent(cls, converter, csharp_inheritance)
        if parent:
            lines.append(f"---@class {cls.lua_name}: {parent}")
        else:
            lines.append(f"---@class {cls.lua_name}")
        for field in cls.fields:
            if is_ident(field.name):
                base_field_type = converter.convert(field.type_raw, cls.lua_name)
                field_type = (
                    LUA_USAGE.field_type(cls.lua_name, field.name)
                    or UNITY_USAGE.field_type(cls.lua_name, field.name)
                    or base_field_type
                )
                doc_field = FieldInfo(
                    field.name,
                    field.type_raw,
                    field.accessor,
                    field.description or field_description(cls.lua_name, field.name),
                    field.deprecated,
                )
                append_field_doc_lines(lines, doc_field)
                lines.append(f"---@field {field.name} {field_type}")
        lines.append(f"{cls.lua_name} = {{}}")
        lines.append("")

        method_groups: dict[str, list[MethodEmission]] = defaultdict(list)
        for method in cls.methods:
            params = tuple(parse_params(method.params_raw, converter, cls.lua_name))
            return_type = cls.lua_name if method.is_constructor else converter.convert(method.return_raw, cls.lua_name)
            signature = LuaSignature(params, return_type)
            signature = apply_optional_params(dump_index, cls, method, signature)
            signature = usage_adjusted_signature(cls.lua_name, method.name, signature)
            signature = csharp_adjusted_return_signature(dump_index, cls, method, signature)
            method_groups[method.name].append(
                MethodEmission(method, signature, is_static_method(cls, method, signature, dump_index))
            )

        for name, emissions in method_groups.items():
            ordered = sorted(emissions, key=lambda emission: (not emission.is_static, len(emission.signature.params)))
            first_emission = ordered[0]
            first_signature = first_emission.signature
            overloads: list[tuple[LuaSignature, str | None]] = []
            seen_dot_signatures = set(overload_signature_variants(first_signature))
            for emission in ordered[1:]:
                for variant in overload_signature_variants(emission.signature):
                    if variant not in seen_dot_signatures:
                        overloads.append((variant, None))
                        seen_dot_signatures.add(variant)

            seen_self_signatures: set[LuaSignature] = set()
            for emission in ordered:
                if emission.is_static:
                    continue
                for variant in overload_signature_variants(emission.signature):
                    if variant in seen_self_signatures:
                        continue
                    overloads.append((variant, cls.lua_name))
                    seen_self_signatures.add(variant)

            doc = method_doc_info(dump_index, cls, emissions)
            docs_lines = [emission.method.docs_line for emission in emissions]
            append_doc_lines(lines, with_description(doc, method_description(cls.lua_name, name, docs_lines)))
            for signature, self_type in overloads:
                lines.append(overload_annotation(signature, self_type))
            for param in first_signature.params:
                lines.append(f"---@param {param.name}{'?' if param.optional else ''} {param.typ}")
            if first_signature.return_type != "nil":
                lines.append(f"---@return {first_signature.return_type}")
            names = ", ".join(param.name for param in first_signature.params)
            lines.append(f"function {cls.lua_name}.{name}({names}) end")
            lines.append("")
    return lines


def placeholder_parent(
    name: str,
    converter: TypeConverter,
    csharp_inheritance: dict[str, str],
) -> str | None:
    raw_parent = csharp_inheritance.get(name)
    if not raw_parent:
        generic_sources = [
            source
            for source in csharp_inheritance
            if name.startswith(f"{source}_")
        ]
        if generic_sources:
            raw_parent = csharp_inheritance[max(generic_sources, key=len)]
    if not raw_parent:
        return None
    return resolve_parent_type(raw_parent, name, converter)


def resolve_placeholder_parents(
    names: set[str],
    converter: TypeConverter,
    csharp_inheritance: dict[str, str],
) -> dict[str, str]:
    parents: dict[str, str] = {}
    pending = sorted(names)
    seen: set[str] = set()
    while pending:
        name = pending.pop(0)
        if name in seen:
            continue
        seen.add(name)
        if not is_ident(name) or name in PRIMITIVE_TYPES:
            continue
        parent = placeholder_parent(name, converter, csharp_inheritance)
        if not parent:
            continue
        parents[name] = parent
        if parent not in converter.known_names and parent not in seen and parent not in pending:
            names.add(parent)
            pending.append(parent)
    return parents


def emit_placeholders(names: set[str], parents: dict[str, str]) -> list[str]:
    lines = []
    for name in sorted(names):
        if not is_ident(name) or name in PRIMITIVE_TYPES:
            continue
        parent = parents.get(name)
        description = class_description(name)
        if description:
            lines.append(f"---{description}")
        if parent and parent != name and is_ident(parent):
            lines.append(f"---@class {name}: {parent}")
        else:
            lines.append(f"---@class {name}")
        lines.append(f"{name} = {{}}")
        lines.append("")
    return lines


def emit_globals(globals_: list[GlobalEntry], converter: TypeConverter) -> list[str]:
    lines = header()
    lines.extend(
        [
            "---@class MoonSharpInfo",
            "---@field version string",
            "---@field luacompat string",
            "---@field platform string",
            "---@field is_aot boolean",
            "---@field is_unity boolean",
            "---@field is_mono boolean",
            "---@field is_clr4 boolean",
            "---@field is_pcl boolean",
            "---@field banner string",
            "",
            "---@type table",
            "_G = _G",
            "",
            "---@type string",
            "_VERSION = _VERSION",
            "",
            "---@type MoonSharpInfo",
            "_MOONSHARP = _MOONSHARP",
            "",
        ]
    )

    emitted: set[str] = {"_G", "_VERSION", "_MOONSHARP"}
    for entry in [*globals_, *EXTRA_GLOBALS]:
        if entry.name in emitted or not is_ident(entry.name):
            continue
        if entry.kind == "userdata" and entry.csharp_type:
            expected_name = simple_candidate(entry.csharp_type)
            if entry.name != expected_name and entry.name not in DOC_GLOBAL_VALUE_ALLOWLIST:
                continue
            typ = converter.convert(entry.csharp_type)
            if entry.name == typ:
                emitted.add(entry.name)
                continue
            description = EXTRA_GLOBAL_DOCS.get(entry.name)
            if description:
                lines.append(f"---{description}")
            lines.append(f"---@type {typ}")
            lines.append(f"{entry.name} = {entry.name}")
            lines.append("")
            emitted.add(entry.name)
        elif (
            entry.kind == "function"
            and entry.name not in BUILTIN_GLOBAL_FUNCTIONS
            and entry.name in DOC_GLOBAL_FUNCTION_ALLOWLIST
        ):
            lines.append("---@param ... any")
            lines.append("---@return any")
            lines.append(f"function {entry.name}(...) end")
            lines.append("")
            emitted.add(entry.name)
    return lines


def emit_stdlib() -> list[str]:
    return header() + [
        "---@class json",
        "---MoonSharp JSON null sentinel.",
        "---@field null any",
        "json = {}",
        "",
        "---Parses a JSON string using MoonSharp's JSON support.",
        "---@param value string",
        "---@return any",
        "function json.parse(value) end",
        "",
        "---Serializes a Lua value using MoonSharp's JSON support.",
        "---@param value any",
        "---@return string",
        "function json.serialize(value) end",
        "",
        "---Returns true when value is MoonSharp's JSON null sentinel.",
        "---@param value any",
        "---@return boolean",
        "function json.isnull(value) end",
        "",
        "---Returns true when s starts with prefix.",
        "---@param s string",
        "---@param prefix string",
        "---@return boolean",
        "function string.startsWith(s, prefix) end",
        "",
        "---Returns true when s ends with suffix.",
        "---@param s string",
        "---@param suffix string",
        "---@return boolean",
        "function string.endsWith(s, suffix) end",
        "",
        "---Returns true when s contains value.",
        "---@param s string",
        "---@param value string",
        "---@return boolean",
        "function string.contains(s, value) end",
        "",
    ]


def generated_comment_hits(outputs: dict[str, list[str]]) -> list[tuple[str, int, str]]:
    hits: list[tuple[str, int, str]] = []
    for key, lines in outputs.items():
        filename = LIBRARY_FILES.get(key, key)
        for line_number, line in enumerate(lines, start=1):
            if not line.startswith("---") or line.startswith("---@"):
                continue
            text = line[3:].strip()
            if any(pattern.search(text) for pattern in GENERIC_DOCUMENTATION_PATTERNS):
                hits.append((filename, line_number, text))
    return hits


def generated_comment_count(outputs: dict[str, list[str]]) -> int:
    return sum(
        1
        for lines in outputs.values()
        for line in lines
        if line.startswith("---") and not line.startswith("---@")
    )


def render_documentation_cleanup_report(
    outputs: dict[str, list[str]],
    accepted_usage_docs: list,
    rejected_usage_docs: list,
    accepted_unity_docs: list,
    rejected_unity_docs: list,
) -> str:
    generic_hits = generated_comment_hits(outputs)
    lines = [
        "# Documentation cleanup",
        "",
        "Generated by `tools/generate_luals_addon.py`.",
        "",
        "## Summary",
        "",
        f"- Generated LuaDoc comment lines: {generated_comment_count(outputs)}",
        f"- Manual docs available: {len(EXTRA_CLASS_DOCS)} classes, {len(EXTRA_FIELD_DOCS)} fields, {len(EXTRA_METHOD_DOCS)} methods, {len(EXTRA_GLOBAL_DOCS)} globals",
        f"- Lua usage docs accepted/rejected: {len(accepted_usage_docs)}/{len(rejected_usage_docs)}",
        f"- Unity mainScene docs accepted/rejected: {len(accepted_unity_docs)}/{len(rejected_unity_docs)}",
        f"- documented_functions.md imported: {DOCUMENTED_DOCS.imported_class_docs} class docs, {DOCUMENTED_DOCS.imported_method_docs} method docs",
        f"- documented_functions.md omitted: empty={DOCUMENTED_DOCS.ignored_empty}, low={DOCUMENTED_DOCS.ignored_low_confidence}, fallback={DOCUMENTED_DOCS.ignored_fallback}, generic={DOCUMENTED_DOCS.ignored_generic}, name-pattern={DOCUMENTED_DOCS.ignored_name_pattern}, misaligned={DOCUMENTED_DOCS.ignored_misaligned}",
        f"- Generic comments still matching cleanup filters: {len(generic_hits)}",
        "",
        "## Policy",
        "",
        "- `docs.txt` remains the source of truth for symbols, signatures and raw types.",
        "- Deprecated markers and dump tooltips are preserved.",
        "- Usage evidence from curated `data/*.json` stays preferred over inferred documentation.",
        "- Generic comments from `documented_functions.md` are omitted instead of imported into hover text.",
        "",
    ]
    if generic_hits:
        lines.extend(["## Remaining Generic Matches", ""])
        for filename, line_number, text in generic_hits[:100]:
            lines.append(f"- `{filename}:{line_number}` {text}")
        if len(generic_hits) > 100:
            lines.append(f"- ... {len(generic_hits) - 100} more")
        lines.append("")
    return "\n".join(lines) + "\n"


RAW_CSHARP_TYPE_LEAK_PATTERNS = (
    "System.Collections",
    "Collections.Generic",
    "Collections.ObjectModel",
    "List`",
    "Dictionary`",
    "IEnumerable`",
    "IReadOnlyList`",
    "ReadOnlyCollection",
    "Nullable`",
    "Action`",
    "Func`",
    "List<",
    "Dictionary<",
    "IEnumerable<",
    "IReadOnlyList<",
    "ReadOnlyCollection<",
    "Nullable<",
    "Action<",
    "Func<",
)


def count_text_in_outputs(outputs: dict[str, list[str]], needle: str) -> int:
    return sum(line.count(needle) for lines in outputs.values() for line in lines)


def raw_csharp_type_leaks(outputs: dict[str, list[str]]) -> list[tuple[str, int, str]]:
    hits: list[tuple[str, int, str]] = []
    for key, lines in outputs.items():
        filename = LIBRARY_FILES.get(key, key)
        for line_number, line in enumerate(lines, start=1):
            if any(pattern in line for pattern in RAW_CSHARP_TYPE_LEAK_PATTERNS):
                hits.append((filename, line_number, line))
    return hits


def render_type_cleanup_report(outputs: dict[str, list[str]]) -> str:
    leaks = raw_csharp_type_leaks(outputs)
    any_array_count = count_text_in_outputs(outputs, "any[]")
    candidate_count = len(TYPE_RETURN_REFINEMENTS) + len(TYPE_ANY_ARRAY_RETURNS_RETAINED)
    lines = [
        "# Type cleanup",
        "",
        "Generated by `tools/generate_luals_addon.py`.",
        "",
        "## Summary",
        "",
        f"- Candidate vague/any[] returns checked: {candidate_count}",
        f"- Return types refined from C# dump evidence: {len(TYPE_RETURN_REFINEMENTS)}",
        f"- any[] return types retained: {len(TYPE_ANY_ARRAY_RETURNS_RETAINED)}",
        f"- any[] occurrences remaining in generated library: {any_array_count}",
        f"- Raw C# collection/delegate type leaks remaining: {len(leaks)}",
        "",
    ]

    if TYPE_RETURN_REFINEMENTS:
        lines.extend(["## Refined Returns", ""])
        for item in sorted(TYPE_RETURN_REFINEMENTS):
            lines.append(f"- `{item}`")
        lines.append("")

    if TYPE_ANY_ARRAY_RETURNS_RETAINED:
        lines.extend(["## Retained any[] Returns", ""])
        for item in sorted(TYPE_ANY_ARRAY_RETURNS_RETAINED):
            lines.append(f"- `{item}`")
        lines.append("")

    if leaks:
        lines.extend(["## Remaining Raw Type Matches", ""])
        for filename, line_number, line in leaks[:100]:
            lines.append(f"- `{filename}:{line_number}` {line}")
        if len(leaks) > 100:
            lines.append(f"- ... {len(leaks) - 100} more")
        lines.append("")

    lines.extend(
        [
            "## Policy",
            "",
            "- Refinements are applied only when a unique converted C# return type is available from the curated dump index.",
            "- ValueTuple/KeyValuePair shapes stay as `table` or `table[]`; no fields are invented.",
            "- Remaining `any[]` entries are kept when the dump does not prove a safer type.",
            "",
        ]
    )
    return "\n".join(lines)


def config_json() -> str:
    data = {
        "$schema": "https://raw.githubusercontent.com/LuaLS/LLS-Addons/main/schemas/addon_config.schema.json",
        "name": "mdrg",
        "description": "LuaLS definitions for the MDRG MoonSharp Lua API.",
        "words": ["ModUtilities", "GameUtilities", "GameId", "ItemPrefab", "CurrentModGuid"],
        "settings": {
            "Lua.runtime.version": "Lua 5.2",
            "Lua.diagnostics.globals": [
                "_MOONSHARP",
                "CurrentModGuid",
                "ModUtilities",
                "GameUtilities",
                "Item",
                "ItemPrefab",
                "ItemPrefabManager",
                "GameId",
                "StorySingleton",
                "SaveSingleton",
                "SoundSingleton",
                "UiOverlay",
                "ViewSingleton",
                "json",
            ],
        },
    }
    return json.dumps(data, indent=2) + "\n"


def info_json() -> str:
    data = {
        "$schema": "https://raw.githubusercontent.com/LuaLS/LLS-Addons/main/schemas/addon_info.schema.json",
        "name": "mdrg",
        "description": "Definitions for the MDRG MoonSharp Lua API.",
    }
    return json.dumps(data, indent=2) + "\n"


def readme_text(relative_library: str) -> str:
    return f"""# mdrg LuaLS addon

LuaLS/Sumneko Lua definition addon for the MDRG MoonSharp Lua API described in `docs.txt`.

The addon provides LuaCATS stubs for globals, enums, userdata classes, methods, fields, MoonSharp JSON helpers, and the extra `string.startsWith`, `string.endsWith`, and `string.contains` helpers.

## Install locally

Use the generated `library/` directory with `workspace.library`:

```json
{{
  "runtime.version": "Lua 5.2",
  "workspace.library": [
    "{relative_library}"
  ],
  "diagnostics.globals": [
    "ModUtilities",
    "GameUtilities",
    "Item",
    "ItemPrefab",
    "ItemPrefabManager",
    "GameId"
  ]
}}
```

For `workspace.userThirdParty`, point LuaLS at the parent directory that contains this addon directory. LuaLS expects each addon directory to contain `config.json` and `library/`.

## Files

- `library/mdrg_globals.d.lua`: runtime globals and exposed singleton/global values.
- `library/mdrg_stdlib.d.lua`: MoonSharp JSON and MDRG string helpers.
- `library/mdrg_enums.d.lua`: enum aliases and enum tables.
- `library/mdrg_usage.d.lua`: autocomplete aliases extracted from Lua scripts generated by the game.
- `library/mdrg_legacy_runtime_aliases.d.lua`: legacy/internal aliases extracted from Unity mainScene Lua snippets.
- `library/mdrg_types.d.lua`: common and fallback types.
- `library/mdrg_items.d.lua`: item, prefab, slot, modifier, fishing, edible, and shop APIs.
- `library/mdrg_story.d.lua`: story, save, condition, and coroutine-related APIs.
- `library/mdrg_ui.d.lua`: UI overlay and popup APIs.
- `library/mdrg_game.d.lua`: game utilities, mod utilities, music, Live2D, generated data, and managers.
- `library/mdrg_unity.d.lua`: Unity/Fungus-facing types present in `docs.txt`.
- `library/mdrg_safe_io.d.lua`: external LuaPatch safe `io` stubs copied from `extern/` when present.
- `examples/test.lua`: autocomplete smoke-test sample.

## Source layout

- `docs.txt`: source of truth for exposed classes, members, signatures, and raw C# type names.
- `documented_functions.md`: reviewed documentation snippets imported only when aligned with `docs.txt`.
- `data/*.json`: curated indexes derived from C# dumps, generated Lua scripts, and Unity mainScene snippets.
- `extern/*.d.lua`: tracked external/plugin stubs copied verbatim into `library/` after generation.
- `luas/`: small tracked research corpus of Lua generated by the game, used by usage/callback analysis tools.
- `library/*.d.lua`: generated LuaLS addon output consumed by editors.

Raw extraction directories such as `dump/` and `rawdump/` are local inputs for rebuilding indexes and are intentionally ignored by Git. `luas/` is intentionally different: it is tracked research corpus, but it is never package payload.

## Generation notes

Definitions are generated from `docs.txt` and curated `data/*.json` files by `tools/generate_luals_addon.py`. External stubs in `extern/*.d.lua` are validated and copied into `library/` after generated MDRG stubs.

Common commands:

```powershell
python .\\tools\\dev.py check
python .\\tools\\dev.py generate
python .\\tools\\dev.py index
python .\\tools\\dev.py sync
python .\\tools\\dev.py clean
```

Normal development should run `dev.py check` before publishing or committing. Use `dev.py index` only after replacing or updating raw local sources. Normal regeneration should use the curated data already committed in `data/`.

Development policy:

- Raw extraction directories such as `dump/` and `rawdump/` stay local and ignored.
- `luas/` is tracked as a compact research corpus for callback/usage tooling; ad-hoc local additions should go under ignored `luas/local/` or `luas/tmp/`.
- If an old checkout shows many `D dump/...` entries, that means the dump files are being removed from Git tracking, not deleted from disk.
- `examples/mods_mixed.lua` is a local research input and is ignored; keep small committed examples in `examples/test.lua`.
- `extern/mdrg_safe_io.d.lua` documents the sandboxed `io` injected by LuaPatch; it replaces the normal `io` view for this addon when present.
- `dev.py validate` checks structure, curated data presence, raw-source tracking policy, and LuaLS availability.
- LuaLS is optional for local checks; when `lua-language-server` is not in `PATH`, validation reports a warning instead of failing.

Type normalization:

- C# primitive types are converted to LuaLS primitives.
- Arrays and common C# collections are converted to `T[]`.
- dictionaries are converted to `table<K, V>`.
- `Func<...>` and `Action<...>` are converted to Lua function types.
- Nested C# names such as `Item+ItemManager` use LuaLS-safe names such as `ItemManager`; colliding names are prefixed with enough parent context to stay unique.
- Constructors from `__new(...)` are preserved as `Class.__new(...)` definition stubs instead of inventing a separate constructor API.

Limitations:

- Hover text is generated conservatively from `docs.txt`, curated data indexes, reviewed documentation, generated Lua usage, and Unity mainScene evidence when those sources line up with exposed members.
- Static versus instance members are read from curated C# data, then inferred conservatively from names and factory patterns. Instance methods are emitted as dot-call stubs with `self` overloads so both MoonSharp-style `obj.Method(...)` and Lua colon calls type-check.
- C# parameters with default values in curated C# data are emitted as optional LuaLS parameters.
- C# `out`/`ref` parameters are represented as normal parameters because the dump does not specify Lua return behavior.
- Placeholder classes are generated for referenced external types that are not fully described in `docs.txt`.
"""


def example_lua() -> str:
    return """-- Autocomplete smoke test for the mdrg LuaLS addon.

local guid = CurrentModGuid
local generic_id = GameId.CreateGeneric(guid, 1001)

local prefab = ModUtilities.CreateItemPrefab("Example Item", "Created from Lua", 25)
local registered_id = ModUtilities.CreateNewItem(guid, prefab)

local item = Item.CreateRandomItem(registered_id, true)
local name = item:ToString()
local description = item:GetDescription()

local prefab_from_manager = ItemPrefabManager.GetItemById(registered_id)
local can_go_into = prefab_from_manager:CanGoInto("body")

GameUtilities.AddItemToInventory(item)

local encoded = json.serialize({
  id = registered_id:ToLuaString(),
  genericId = generic_id:ToLuaString(),
  name = name,
  description = description,
  canGoInto = can_go_into,
})
local decoded = json.parse(encoded)

if string.startsWith(name, "Example") then
  print(decoded)
end
"""


def write_lines(path: Path, lines: list[str]) -> None:
    path.write_text("\n".join(lines).rstrip() + "\n", encoding="utf-8")


def raw_param_names(params_raw: str) -> set[str]:
    names: set[str] = set()
    for part in split_generic_args(params_raw):
        if "__" not in part:
            continue
        name = part.split("__", 1)[0].strip()
        if name:
            names.add(name)
    return names


def validate_usage_candidates(
    usage,
    classes: dict[str, ClassInfo],
) -> tuple[list[str], list[str], list[str], list[str]]:
    classes_by_lua_name = {cls.lua_name: cls for cls in classes.values()}
    method_names = {
        (cls.lua_name, method.name)
        for cls in classes.values()
        for method in cls.methods
    }
    field_names = {
        (cls.lua_name, field.name)
        for cls in classes.values()
        for field in cls.fields
    }
    method_param_names = {
        (cls.lua_name, method.name, param_name)
        for cls in classes.values()
        for method in cls.methods
        for param_name in raw_param_names(method.params_raw)
    }

    accepted_docs: list[str] = []
    rejected_docs: list[str] = []
    for class_name in usage.class_docs:
        if class_name in classes_by_lua_name:
            accepted_docs.append(f"class {class_name}")
        else:
            rejected_docs.append(f"class {class_name} (missing in docs.txt)")
    for class_name, method_name in usage.method_docs:
        label = f"method {class_name}.{method_name}"
        if (class_name, method_name) in method_names:
            accepted_docs.append(label)
        else:
            rejected_docs.append(f"{label} (missing in docs.txt)")
    for class_name, field_name in usage.field_docs:
        label = f"field {class_name}.{field_name}"
        if (class_name, field_name) in field_names:
            accepted_docs.append(label)
        else:
            rejected_docs.append(f"{label} (missing in docs.txt)")

    accepted_type_overrides: list[str] = []
    rejected_type_overrides: list[str] = []
    for class_name, method_name, param_name in usage.method_param_type_overrides:
        label = f"param {class_name}.{method_name}.{param_name}"
        if (class_name, method_name, param_name) in method_param_names:
            accepted_type_overrides.append(label)
        else:
            rejected_type_overrides.append(f"{label} (missing in docs.txt)")
    for class_name, field_name in usage.field_type_overrides:
        label = f"field type {class_name}.{field_name}"
        if (class_name, field_name) in field_names:
            accepted_type_overrides.append(label)
        else:
            rejected_type_overrides.append(f"{label} (missing in docs.txt)")

    return accepted_docs, rejected_docs, accepted_type_overrides, rejected_type_overrides


def copy_external_stubs(base: Path, library: Path) -> list[str]:
    extern = base / "extern"
    if not extern.exists():
        return []

    copied: list[str] = []
    generated_names = set(LIBRARY_FILES.values())
    for source in sorted(extern.glob("*.d.lua")):
        first = source.read_text(encoding="utf-8").splitlines()[0:1]
        if first != ["---@meta"]:
            raise RuntimeError(f"{source.relative_to(base)} does not start with ---@meta")
        if source.name in generated_names:
            raise RuntimeError(f"{source.relative_to(base)} conflicts with a generated library file")

        shutil.copyfile(source, library / source.name)
        copied.append(source.name)

    return copied


def write_addon(base: Path, outputs: dict[str, list[str]]) -> list[str]:
    library = base / "library"
    examples = base / "examples"
    library.mkdir(parents=True, exist_ok=True)
    examples.mkdir(parents=True, exist_ok=True)

    for file in library.glob("mdrg_*.d.lua"):
        file.unlink()
    misplaced_config = library / "config.json"
    if misplaced_config.exists():
        misplaced_config.unlink()

    for domain, lines in outputs.items():
        write_lines(library / LIBRARY_FILES[domain], lines)

    copied_external = copy_external_stubs(base, library)
    (base / "config.json").write_text(config_json(), encoding="utf-8")
    (base / "README.md").write_text(readme_text("./library"), encoding="utf-8")
    (examples / "test.lua").write_text(example_lua(), encoding="utf-8")
    return copied_external


def main() -> None:
    global DOCUMENTED_DOCS, LUA_USAGE, UNITY_USAGE, RUNTIME_PROBE
    TYPE_RETURN_REFINEMENTS.clear()
    TYPE_ANY_ARRAY_RETURNS_RETAINED.clear()
    globals_, enums, classes = parse_docs()
    name_map = assign_lua_names(globals_, enums, classes)
    parse_members(classes)
    add_extra_class_fields(classes)
    loaded_csharp_indexes = load_csharp_indexes(CSHARP_INDEX)
    if loaded_csharp_indexes:
        csharp_docs = loaded_csharp_indexes[0]
    else:
        csharp_docs = build_csharp_doc_index()
    apply_csharp_field_docs(classes, csharp_docs)
    LUA_USAGE = load_lua_usage_index(LUA_USAGE_INDEX) or build_lua_usage_index(ROOT)
    UNITY_USAGE = load_unity_usage_index(UNITY_USAGE_INDEX) or build_unity_usage_index(ROOT)
    RUNTIME_PROBE = load_runtime_probe_index(RUNTIME_PROBE_INDEX) or {}
    (
        accepted_usage_docs,
        rejected_usage_docs,
        accepted_usage_type_overrides,
        rejected_usage_type_overrides,
    ) = validate_usage_candidates(LUA_USAGE, classes)
    (
        accepted_unity_docs,
        rejected_unity_docs,
        accepted_unity_type_overrides,
        rejected_unity_type_overrides,
    ) = validate_usage_candidates(UNITY_USAGE, classes)
    DOCUMENTED_DOCS = parse_documented_functions(
        DOCUMENTED_FUNCTIONS,
        DOCS.read_text(encoding="utf-8").splitlines(),
    )

    known_names = {info.lua_name for info in enums.values()} | {info.lua_name for info in classes.values()}
    converter = TypeConverter(name_map, known_names)
    if loaded_csharp_indexes:
        csharp_inheritance = loaded_csharp_indexes[1]
        dump_index = loaded_csharp_indexes[2]
    else:
        dump_index = build_csharp_method_index(converter)
        csharp_inheritance = build_csharp_inheritance_index()

    classes_by_domain: dict[str, list[ClassInfo]] = defaultdict(list)
    for cls in classes.values():
        classes_by_domain[class_domain(cls.lua_name)].append(cls)

    outputs: dict[str, list[str]] = {
        "globals": emit_globals(globals_, converter),
        "stdlib": emit_stdlib(),
        "enums": emit_enums(enums),
        "usage": emit_usage_aliases(LUA_USAGE, header()),
        "legacy": emit_legacy_runtime_aliases(UNITY_USAGE, header(), RUNTIME_PROBE),
    }
    for domain in ["items", "story", "ui", "game", "unity"]:
        outputs[domain] = emit_classes(
            classes_by_domain.get(domain, []),
            converter,
            dump_index,
            csharp_inheritance,
        )

    type_classes = classes_by_domain.get("types", [])
    type_lines = emit_classes(type_classes, converter, dump_index, csharp_inheritance)
    placeholder_parents = resolve_placeholder_parents(
        converter.unknown_names,
        converter,
        csharp_inheritance,
    )
    type_lines.extend(emit_placeholders(converter.unknown_names, placeholder_parents))
    outputs["types"] = type_lines

    copied_external = write_addon(ROOT, outputs)
    (ROOT / "info.json").write_text(info_json(), encoding="utf-8")
    LUA_USAGE_REPORT.parent.mkdir(parents=True, exist_ok=True)
    LUA_USAGE_REPORT.write_text(
        render_usage_report(
            LUA_USAGE,
            accepted_usage_docs,
            rejected_usage_docs,
            accepted_usage_type_overrides,
            rejected_usage_type_overrides,
        ),
        encoding="utf-8",
    )
    UNITY_USAGE_REPORT.write_text(
        render_unity_report(
            UNITY_USAGE,
            accepted_unity_docs,
            rejected_unity_docs,
            accepted_unity_type_overrides,
            rejected_unity_type_overrides,
        ),
        encoding="utf-8",
    )
    RUNTIME_PROBE_REPORT.write_text(
        render_runtime_probe_report(RUNTIME_PROBE),
        encoding="utf-8",
    )
    DOCUMENTATION_CLEANUP_REPORT.write_text(
        render_documentation_cleanup_report(
            outputs,
            accepted_usage_docs,
            rejected_usage_docs,
            accepted_unity_docs,
            rejected_unity_docs,
        ),
        encoding="utf-8",
    )
    TYPE_CLEANUP_REPORT.write_text(
        render_type_cleanup_report(outputs),
        encoding="utf-8",
    )

    print(
        f"Generated {len(classes)} classes, {len(enums)} enums, "
        f"{len(converter.unknown_names)} placeholders into library/."
    )
    if copied_external:
        print("Copied external stubs: " + ", ".join(copied_external))
    if DOCUMENTED_FUNCTIONS.exists():
        print(
            "Imported documented comments: "
            f"{DOCUMENTED_DOCS.imported_class_docs} classes, "
            f"{DOCUMENTED_DOCS.imported_method_docs} methods "
            f"(ignored empty={DOCUMENTED_DOCS.ignored_empty}, "
            f"low={DOCUMENTED_DOCS.ignored_low_confidence}, "
            f"fallback={DOCUMENTED_DOCS.ignored_fallback}, "
            f"generic={DOCUMENTED_DOCS.ignored_generic}, "
            f"name-pattern={DOCUMENTED_DOCS.ignored_name_pattern}, "
            f"misaligned={DOCUMENTED_DOCS.ignored_misaligned})."
        )
    if LUA_USAGE.lua_files:
        print(
            "Imported Lua usage evidence: "
            f"{len(LUA_USAGE.aliases)} aliases, "
            f"{len(accepted_usage_docs)} docs, "
            f"{len(accepted_usage_type_overrides)} type overrides "
            f"(rejected docs={len(rejected_usage_docs)}, "
            f"rejected type overrides={len(rejected_usage_type_overrides)})."
        )
    if UNITY_USAGE.source_txt:
        print(
            "Imported Unity mainScene evidence: "
            f"{len(UNITY_USAGE.aliases)} aliases, "
            f"{len(accepted_unity_docs)} docs, "
            f"{len(accepted_unity_type_overrides)} type overrides "
            f"(rejected docs={len(rejected_unity_docs)}, "
            f"rejected type overrides={len(rejected_unity_type_overrides)})."
        )
    if RUNTIME_PROBE.get("source_report"):
        print(
            "Imported runtime probe evidence: "
            f"{len(RUNTIME_PROBE.get('runtime_aliases', []))} aliases, "
            f"{len(RUNTIME_PROBE.get('present_symbols', []))} present symbols, "
            f"{len(RUNTIME_PROBE.get('enum_like_userdata', []))} enum-like userdata."
        )
    if TYPE_RETURN_REFINEMENTS or TYPE_ANY_ARRAY_RETURNS_RETAINED:
        print(
            "Type cleanup: "
            f"{len(TYPE_RETURN_REFINEMENTS)} return refinements, "
            f"{len(TYPE_ANY_ARRAY_RETURNS_RETAINED)} any[] returns retained."
        )


if __name__ == "__main__":
    main()

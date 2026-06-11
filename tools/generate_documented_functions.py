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
        r"^C# type exposed to Lua/MoonSharp\b",
        r"^.* type exposed to Lua/MoonSharpp\b",
        r"^.* system type exposed to Lua/MoonSharp\b",
        r"^Executes the runtime operation exposed by ",
        r"^Returns\.$",
        r"^Set\.$",
        r"^Creates a new instance of [A-Za-z_][\w.]*\.$",
        r"^Creates an instance of [A-Za-z_][\w.]*\.$",
        r"^Returns a textual representation of this instance\.$",
        r"^Compares this instance with another value or compatible instance\.$",
        r"^Returns the hash code of this instance\.$",
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
    "ModUtilities": "Helper exposed to Lua mod scripts for creating and registering items, loading assets, adding items to shops, preparing personality modules, accessing controllers, and controlling runtime coroutines.",
    "ItemPrefab": "Configurable item model before/after registration in the game; scripts usually populate fields, attach optional textures/data, and register the item through ModUtilities.",
    "Item": "Runtime instance of an item in inventory/equipment, used in callbacks such as OnUse and SpecialEffectAction.",
    "StoryCondition": "Base class for conditions used by the story/event system to verify requirements, combine conditions, and generate textual or code representations.",
    "LuaStoryCondition": "Story condition based on Lua/MoonSharp code provided by a script.",
    "LuaPersonalityModuleDefinition": "Lua definition of a personality module; groups dialogue containers and is later linked to a registered item.",
    "StoryBotDialogueBranch": "Bot dialogue branch used by personality modules and dialogue containers.",
    "StoryBotDialogueBranchContainer": "Container of dialogue branches associated with a dialogue/event identifier.",
    "TextureOverriderManager": "Manager for overriding/restoring sprites/textures by visual target, used by item effects and room overrides.",
    "UiOverlay": "UI overlay and popup utilities exposed to Lua.",
    "GameUtilities": "General game utilities exposed to Lua, including view transitions, inventory operations, and coroutine wait helpers.",
    "GameVariables": "Global game state exposed for reading, writing, and conditions.",
    "GameId": "Identifier of a game item or resource, including vanilla items and mod-registered items.",
    "ColorSlot": "Defines an editable item color slot, usually associated with a palette.",
    "ColorPalette": "Collection of configurable colors used by color slots.",
    "ColorPaletteManager": "Access to color palettes registered by the game.",
    "SlotEquipData": "Modern equipment/slot data for ItemPrefab, including possible, required, and forbidden slots.",
    "SusModifier": "Coverage/suspicion modifier associated with an item's visual areas.",
    "EdibleItemPrefabData": "Food/consumable-specific data associated with ItemPrefab.EdibleData.",
    "FishItemPrefabData": "Fish-specific data associated with ItemPrefab.FishData.",
    "ItemModifiableVariableFactory": "Factory for modifiable variables associated with items and visual element conditions.",
    "ItemScopeCondition": "Base class for item scope conditions used by requirements and variable-dependent elements.",
    "ItemScopeConditionSpecialVariable": "Item scope condition based on a special/modifiable variable.",
}


METHOD_DOCS: dict[tuple[str, str], str] = {
    ("ModUtilities", "CreateItemPrefab"): "Creates a configurable ItemPrefab for Lua scripts before item registration.",
    ("ModUtilities", "CreateNewItemAutoAssignId"): "Registers an ItemPrefab for a mod and returns an automatically generated GameId.",
    ("ModUtilities", "CreateNewItem"): "Registers an ItemPrefab for a mod and returns the GameId of the registered item.",
    ("ModUtilities", "AddSingleBuyItemToShop"): "Adds a registered item to a shop as a one-time purchase.",
    ("ModUtilities", "AddGenericItemToShop"): "Adds a registered item to a shop as a generic/repurchaseable item.",
    ("ModUtilities", "GetModFile"): "Returns a file from the mod package by mod Guid and internal path.",
    ("ModUtilities", "GetPackedTexture"): "Loads a packed texture container from the mod package.",
    ("ModUtilities", "GetTexture"): "Loads a Texture2D from the mod package.",
    ("ModUtilities", "GetTextureReference"): "Creates an automatic reference for a Texture2D from the mod package.",
    ("ModUtilities", "GetSprite"): "Loads a Sprite from an asset in the mod package.",
    ("ModUtilities", "GetSpriteReference"): "Creates an automatic reference for a Sprite from the mod package.",
    ("ModUtilities", "GetAsSprite"): "Creates a Sprite reference converted from a texture in the mod package.",
    ("ModUtilities", "PrepareNewPersonalityDefinition"): "Creates a personality module definition to receive dialogue containers and dialogue branches.",
    ("ModUtilities", "StartCoroutine"): "Starts a MoonSharp closure as a coroutine managed by the mod runtime.",
    ("ModUtilities", "StopCoroutine"): "Stops a coroutine started by the mod runtime.",
    ("ModUtilities", "WaitForSeconds"): "Creates a wait object to be used with coroutine.yield in Lua scripts.",
    ("ModUtilities", "GetController"): "Returns the ControllerEnum associated with a controller/scene textual identifier.",
    ("GameUtilities", "WaitForSecondsYield"): "Creates a wait object to delay a Lua coroutine by the specified number of seconds.",
    ("ItemPrefab", "AddTexture"): "Attaches a packed texture to the prefab, optionally limited to a specific controller/scene.",
    ("ItemPrefab", "AddAtLeastOneEnabledAllModifiableVariablesRequirement"): "Adds a requirement that at least one modifiable variable of the item is enabled.",
    ("ItemPrefab", "AddAtLeastOneEnabledModifiableVariablesRequirement"): "Adds a requirement that at least one of the specified modifiable variables is enabled.",
    ("ItemPrefab", "AddBoolModifiableVariable"): "Adds a boolean modifiable variable to the prefab.",
    ("ItemPrefab", "AddFloatModifiableVariable"): "Adds a numeric modifiable variable to the prefab.",
    ("ItemPrefab", "AddItemModifiableVariablesRequirement"): "Adds a requirement based on the item's modifiable variables.",
    ("ItemPrefab", "AddHoodieLogoTexture"): "Adds a modifiable logo texture for a compatible hoodie/clothing item.",
    ("ItemPrefab", "AddModdableLogos"): "Adds moddable logo configurations to the prefab.",
    ("ItemPrefab", "TurnIntoPersonalityModule"): "Configures the registered item as a personality module using a Lua definition.",
    ("ItemPrefab", "MakeSet"): "Marks or creates a set association between related items.",
    ("ItemPrefab", "MakePair"): "Marks two items as a related pair/set.",
    ("Item", "GetCount"): "Returns the stacked quantity of the item's runtime instance.",
    ("Item", "GetUniqueGuid"): "Returns the unique Guid of the item's runtime instance.",
    ("Item", "IsEquipped"): "Returns whether the item's runtime instance is equipped.",
    ("Item", "GetItemPrefab"): "Returns the ItemPrefab associated with this item's runtime instance.",
    ("Item", "GetMainColorFromAdditionalData"): "Reads the primary color stored in the item's runtime instance additional data.",
    ("Item", "SetColorIntoAdditionalData"): "Stores a color in a slot of the item's runtime instance additional data.",
    ("StoryCondition", "Lua"): "Creates a story condition evaluated by Lua code.",
    ("StoryCondition", "Delegate"): "Creates a story condition evaluated by a boolean callback.",
    ("StoryCondition", "And"): "Combines conditions and requires all of them to be true.",
    ("StoryCondition", "Or"): "Combines conditions and requires at least one of them to be true.",
    ("StoryCondition", "NotAnd"): "Combines conditions with negation of the And result.",
    ("StoryCondition", "NotOr"): "Combines conditions with negation of the Or result.",
    ("LuaPersonalityModuleDefinition", "PrepareContainer"): "Returns or prepares a dialogue container identified by tag/stage.",
    ("StoryBotDialogueBranchContainer", "AddBranch"): "Adds a dialogue branch to the container.",
    ("TextureOverriderManager", "SetSprite"): "Applies a sprite override to a visual target, optionally scoped by a unique Guid.",
    ("TextureOverriderManager", "RestoreSprite"): "Restores the original sprite of a previously modified visual target.",
    ("TextureOverriderManager", "GetSpecialEffectsAction"): "Creates a callback compatible with SpecialEffectAction to apply/restore a visual target sprite.",
    ("UiOverlay", "OkPopup"): "Displays a simple popup with title, text, and an optional OK action.",
    ("UiOverlay", "CloseUiOverlay"): "Closes the currently open UI overlay.",
}


WORD_TRANSLATIONS = {
    "action": "action",
    "actions": "actions",
    "active": "active",
    "all": "all",
    "audio": "audio",
    "bool": "boolean",
    "boolean": "boolean",
    "branch": "branch",
    "branches": "branches",
    "callback": "callback",
    "clip": "clip",
    "color": "color",
    "condition": "condition",
    "conditions": "conditions",
    "container": "container",
    "controller": "controller",
    "current": "current",
    "data": "data",
    "default": "default",
    "description": "description",
    "enabled": "enabled",
    "file": "file",
    "guid": "guid",
    "id": "id",
    "identifier": "identifier",
    "item": "item",
    "items": "items",
    "localizable": "localizable",
    "manager": "manager",
    "modifiable": "modifiable",
    "module": "module",
    "music": "music",
    "name": "name",
    "new": "new",
    "pair": "pair",
    "palette": "palette",
    "popup": "popup",
    "prefab": "prefab",
    "price": "price",
    "reference": "reference",
    "requirement": "requirement",
    "requirements": "requirements",
    "resource": "resource",
    "result": "result",
    "scene": "scene",
    "slot": "slot",
    "slots": "slots",
    "song": "song",
    "special": "special",
    "sprite": "sprite",
    "stat": "stat",
    "string": "string",
    "summary": "summary",
    "target": "target",
    "text": "text",
    "texture": "texture",
    "time": "time",
    "value": "value",
    "variable": "variable",
    "variables": "variables",
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
        desc = "Condition type exposed to Lua/MoonSharp for validating requirements, explaining the condition, and/or generating a code representation."
        confidence = "medium" if raw_info or dump_info else "low"
        evidence = ["rawdump" if raw_info else "dump" if dump_info else "fallback", "name-pattern"]
    elif "item" in searchable:
        desc = "Item system type exposed to Lua/MoonSharp for creating, querying, or configuring item-related data."
        confidence = "medium" if raw_info or dump_info else "low"
        evidence = ["rawdump" if raw_info else "dump" if dump_info else "fallback", "name-pattern"]
    elif "reference" in searchable or "resource" in searchable:
        desc = "Serializable reference/resource type exposed to Lua/MoonSharp for locating or loading game/mod assets."
        confidence = "medium" if raw_info or dump_info else "low"
        evidence = ["rawdump" if raw_info else "dump" if dump_info else "fallback", "name-pattern"]
    elif "result" in searchable:
        desc = "Result type exposed to Lua/MoonSharp for representing the output or state of an operation."
        confidence = "medium" if raw_info or dump_info else "low"
        evidence = ["rawdump" if raw_info else "dump" if dump_info else "fallback", "name-pattern"]
    elif "view" in searchable or "scene" in searchable or "controller" in searchable:
        desc = "View/scene/controller system type exposed to Lua/MoonSharp for interacting with the game's visual state."
        confidence = "medium" if raw_info or dump_info else "low"
        evidence = ["rawdump" if raw_info else "dump" if dump_info else "fallback", "name-pattern"]
    elif "stat" in searchable or "variable" in searchable:
        desc = "Game stat/variable type exposed to Lua/MoonSharp for reading, modifying, or representing state values."
        confidence = "medium" if raw_info or dump_info else "low"
        evidence = ["rawdump" if raw_info else "dump" if dump_info else "fallback", "name-pattern"]
    else:
        fields = len(raw_info.fields) if raw_info else len(dump_info.fields) if dump_info else 0
        methods = len(raw_info.methods) if raw_info else len(dump_info.methods) if dump_info else 0
        suffix = f" Contains {fields} fields and {methods} methods identified in the dump." if fields or methods else ""
        desc = f"C# type exposed to Lua/MoonSharp for use in game scripts.{suffix}"
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
        desc = f"Creates a new instance of {entry.section}."
        evidence.append("name-pattern")
        confidence = "medium" if dump_has_method or raw_info or dump_info else "low"
    elif method == "ToString":
        desc = "Returns a textual representation of this instance."
        evidence.append("name-pattern")
        confidence = "medium"
    elif method == "Equals":
        desc = "Compares this instance with another value or compatible instance."
        evidence.append("name-pattern")
        confidence = "medium"
    elif method == "GetHashCode":
        desc = "Returns the hash code of this instance."
        evidence.append("name-pattern")
        confidence = "medium"
    elif method == "ResetStat":
        desc = "Restores this stat to its default value."
        evidence.append("name-pattern")
        confidence = "medium" if "Stat" in class_simple or "Stat" in section.source_type else "low"
    elif method == "SetValue":
        desc = "Sets the value stored in this instance."
        evidence.append("name-pattern")
        confidence = "medium"
    elif method == "GetValue":
        desc = "Returns the value stored in this instance."
        evidence.append("name-pattern")
        confidence = "medium"
    elif method == "GetIdentifier":
        desc = "Returns the identifier associated with this reference or resource."
        evidence.append("name-pattern")
        confidence = "medium"
    elif method == "IsNull":
        desc = "Returns whether this reference or value is null."
        evidence.append("name-pattern")
        confidence = "medium"
    elif method == "GetResource":
        desc = "Returns the resource associated with this reference."
        evidence.append("name-pattern")
        confidence = "medium"
    elif method == "Explain":
        desc = "Returns a textual description of this condition or object."
        evidence.append("name-pattern")
        confidence = "medium" if "Condition" in class_simple or "Result" in class_simple else "low"
    elif method == "GenerateCode":
        desc = "Generates a code/script representation for this instance."
        evidence.append("name-pattern")
        confidence = "medium"
    elif method == "GenerateVariableName":
        desc = "Generates a textual variable name for this instance."
        evidence.append("name-pattern")
        confidence = "medium"
    elif method in {"ConditionMet", "InnerConditionMet"}:
        desc = "Evaluates whether the condition is satisfied in the current state."
        evidence.append("name-pattern")
        confidence = "medium"
    elif method.startswith("Create"):
        target = subject_from_method(method, "Create")
        if method == "CreateInstance":
            desc = f"Creates an instance of {ret if ret != 'nil' else entry.section}."
        else:
            desc = f"Create {target} and returns {ret}." if ret != "nil" else f"Create {target}."
        evidence.append("name-pattern")
        confidence = "medium" if dump_has_method or usage_hits else "low"
    elif method.startswith("Prepare"):
        target = subject_from_method(method, "Prepare")
        desc = f"Prepares {target} and returns {ret}." if ret != "nil" else f"Prepara {target}."
        evidence.append("name-pattern")
        confidence = "medium" if dump_has_method or usage_hits else "low"
    elif method.startswith("Get"):
        target = subject_from_method(method, "Get")
        desc = f"Returns {target}."
        evidence.append("name-pattern")
        confidence = "medium" if dump_has_method or usage_hits else "low"
    elif method.startswith("Set"):
        target = subject_from_method(method, "Set")
        desc = f"Set {target}."
        evidence.append("name-pattern")
        confidence = "medium" if dump_has_method or usage_hits else "low"
    elif method.startswith("Add"):
        target = subject_from_method(method, "Add")
        desc = f"Add {target}."
        evidence.append("name-pattern")
        confidence = "medium" if dump_has_method or usage_hits else "low"
    elif method.startswith("Remove"):
        target = subject_from_method(method, "Remove")
        desc = f"Remove {target}."
        evidence.append("name-pattern")
        confidence = "medium" if dump_has_method or usage_hits else "low"
    elif method.startswith("Is"):
        target = subject_from_method(method, "Is")
        desc = f"Returns if {target}."
        evidence.append("name-pattern")
        confidence = "medium" if dump_has_method or usage_hits else "low"
    elif method.startswith("Has"):
        target = subject_from_method(method, "Has")
        desc = f"Return if has {target}."
        evidence.append("name-pattern")
        confidence = "medium" if dump_has_method or usage_hits else "low"
    elif method.startswith("Make"):
        target = subject_from_method(method, "Make")
        desc = f"Configures or creates the relationship of {target}."
        evidence.append("name-pattern")
        confidence = "medium" if dump_has_method or usage_hits else "low"
    else:
        desc = f"Executes the runtime operation exposed by {entry.section}.{method}."
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
        "Generated source to review and copy LuaDoc to MDRG stubs. Each entry comes from `undocumented_functions.md` and receives a balanced description with `Confidence` and `Evidence`.",
        "",
        "Notas:",
        "- `rawdump/` and `dump/` are used as signature/context evidence; Il2CppInterop wrappers are not described as behavior.",
        "- Low-confidence descriptions are intentionally conservative.",
        "- This file does not alter library/ nor the stub generator.",
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

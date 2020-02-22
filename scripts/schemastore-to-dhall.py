#!/bin/env python3
# Copyright 2020 Red Hat
#
# Licensed under the Apache License, Version 2.0 (the "License"); you may
# not use this file except in compliance with the License. You may obtain
# a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
# WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
# License for the specific language governing permissions and limitations
# under the License.

import json
import pprint
import sys
from typing import Any, Dict, List, Optional, Tuple

Object = Dict[str, Any]
Property = Dict[str, Any]
Defs = Dict[str, Property]

# A dhall type
Attribute = str
DhallType = str
Type = Dict[Attribute, DhallType]

# The list of type
TypeName = str
Types = List[Tuple[TypeName, Type]]

# Prometheus hardcoded work around to fixup invalid types
Fixes: Dict[TypeName, Type] = dict(
    params=dict(
        module="Optional (List Text)"
    )
)


def capitalize(name: str) -> str:
    return "".join(map(lambda x: x[0].upper() + x[1:], name.split('_')))


def dhall_type(value: Property, name: str, types: Types, defs: Defs) -> Tuple[DhallType, Types]:
    """Convert a property to a dhall type name. Also add newly discovered types to the list of types"""
    _type: Optional[str] = None
    value.setdefault('type', ['string'])
    if not isinstance(value['type'], list):
        value['type'] = [value['type']]
    if value.get("$ref"):
        ref = value['$ref'].split('/')[-1]
        return dhall_type(defs[ref], ref, types, defs)

    elif "object" in value["type"]:
        types = types + dhall_record(value, name, defs)
        _type = "(./" + capitalize(name) + ".dhall).Type"
    elif "array" in value["type"]:
        _type, types = dhall_type(value['items'], name[:-1], types, defs)
        _type = "List %s" % _type.replace('Optional ', '')
    elif "string" in value["type"]:
        _type = 'Text'
    elif "integer" in value["type"]:
        _type = 'Natural'
    elif "boolean" in value["type"]:
        _type = 'Bool'
    if _type is None:
        print("Unable to convert", value)
        raise RuntimeError

    if ' ' in _type:
        _type = f"({_type})"
    return (("Optional " if name not in value.get("required", []) else "") + _type, types)


def dhall_record(obj: Object, name: str, defs: Defs) -> Types:
    """Convert an object to a list of named dhall record"""
    types: Types = []
    new_type: Type = {}
    if name in Fixes and not obj.get('properties'):
        new_type.update(Fixes[name])
    for key, value in obj.get('properties', {}).items():
        dhall_type_str, types = dhall_type(value, key, types, defs)
        new_type[key] = dhall_type_str
    return types + [(capitalize(name), new_type)]


SchemasFiles = List[Tuple[str, str]]
def processSchema(path: str) -> SchemasFiles:
    schema = json.loads(open(path).read())
    results: SchemasFiles = []
    for name, type_def in dhall_record(schema, "Config", schema["definitions"]):
        defaults = " , ".join([
            f"{k} = {v.replace('Optional', 'None')}"
            for k,v in type_def.items()
            if v.startswith("Optional ")])
        results.append((
            f"schemas/{name}.dhall",
            "{ %s }" % " , ".join([
                "Type = { %s }" % " , ".join([f"{k} : {v}" for k,v in type_def.items()]),
                "default = { %s }" % (defaults if defaults else "=")])))
    return results


if __name__ == "__main__":
    try:
        path = sys.argv[1].split('/')[-1]
    except:
        print("usage: %s file" % sys.argv[0])
        exit(1)
    for path, content in processSchema(path):
        open(path, "w").write(content)

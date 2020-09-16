--| The Labels schema provides functions to simplify JSON/Type creation
let JSON =
      https://prelude.dhall-lang.org/v17.0.0/JSON/package.dhall sha256:79dfc281a05bc7b78f927e0da0c274ee5709b1c55c9e5f59499cb28e9d6f3ec0

let severity
    : Text -> JSON.Type
    = \(sev : Text) -> JSON.object (toMap { severity = JSON.string sev })

let mapText
    : List { mapKey : Text, mapValue : Text } -> JSON.Type
    = https://raw.githubusercontent.com/softwarefactory-project/dhall-zuul/0.2.0/Zuul/Vars/mapText.dhall sha256:66a4ca966e805ff1da369041bde29b4d850700d61ab00f1ce182d95bb07c88f1

in  { Type = JSON.Type, severity, mapText }

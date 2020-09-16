-- Interpret using this command:
--    podman run -it --rm -v $(pwd):/data:Z quay.io/software-factory/shake-factory
--
-- Learn more at: https://softwarefactory-project.io/cgit/software-factory/shake-factory/tree/README.md

import Development.Shake
import ShakeFactory
import ShakeFactory.Dhall

storeUrl :: String
storeUrl = "https://raw.githubusercontent.com/SchemaStore/schemastore/master/src/schemas/json/"

updateSchemas :: Action ()
updateSchemas = do
  cmd_ "python3" "scripts/schemastore-to-dhall.py" "Config" (storeUrl <> "prometheus.json")
  cmd_ "python3" "scripts/schemastore-to-dhall.py" "RulesConfig" (storeUrl <> "prometheus.rules.json")
  cmd_ "find" "." "-name" "*.dhall" "-exec" "dhall" "--ascii" "format" "--inplace" "{}" ";"

main = shakeMain $ do
  want ["README.md", "package.dhall"]
  "README.md" %> dhallReadmeAction
  "package.dhall" %> dhallTopLevelPackageAction "./Prometheus/package.dhall"
  "//package.dhall" %> dhallPackageAction
  dhallDocsRules "dhall-prometheus"
  phony "update" updateSchemas
  cleanRules

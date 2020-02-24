all: update lint freeze doc

STORE_URL = "https://raw.githubusercontent.com/SchemaStore/schemastore/master/src/schemas/json/"
update:
	@python3 scripts/schemastore-to-dhall.py Config $(STORE_URL)/prometheus.json
	@python3 scripts/schemastore-to-dhall.py RulesConfig $(STORE_URL)/prometheus.rules.json

freeze:
	@python3 scripts/gen_package.py schemas > package.dhall
	@dhall freeze --inplace ./package.dhall --all

lint:
	@find . -name "*.dhall" -exec dhall --ascii format --inplace {} \;

doc:
	@python3 scripts/doc.py

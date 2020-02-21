all: update lint freeze

update:
	@python3 scripts/generate.py

freeze:
	@dhall freeze --inplace ./package.dhall --all

lint:
	@find . -name "*.dhall" -exec dhall --ascii format --inplace {} \;

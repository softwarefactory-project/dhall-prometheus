{ Type =
    { targets : Optional (List Text), labels : Optional (./Labels.dhall).Type }
, default = { targets = None (List Text), labels = None (./Labels.dhall).Type }
}

{ Type =
    { name : Optional Text
    , interval : Optional Text
    , rules : Optional (List (./AlertingRule.dhall).Type)
    }
, default =
    { name = None Text
    , interval = None Text
    , rules = None (List (./AlertingRule.dhall).Type)
    }
}

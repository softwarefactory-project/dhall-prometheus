{ Type =
    { alert : Optional Text
    , expr : Optional Text
    , for : Optional Text
    , labels : Optional (./Labels.dhall).Type
    , annotations : Optional (./Annotations.dhall).Type
    }
, default =
  { alert = None Text
  , expr = None Text
  , for = None Text
  , labels = None (./Labels.dhall).Type
  , annotations = None (./Annotations.dhall).Type
  }
}

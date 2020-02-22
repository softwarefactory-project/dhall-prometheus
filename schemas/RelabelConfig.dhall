{ Type =
    { source_labels : Optional (List Text)
    , separator : Optional Text
    , target_label : Optional Text
    , regex : Optional Text
    , modulus : Optional Natural
    , replacement : Optional Text
    , action : Optional Text
    }
, default =
    { source_labels = None (List Text)
    , separator = None Text
    , target_label = None Text
    , regex = None Text
    , modulus = None Natural
    , replacement = None Text
    , action = None Text
    }
}

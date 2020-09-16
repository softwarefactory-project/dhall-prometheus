{ Type =
    { ca_file : Optional Text
    , cert_file : Optional Text
    , key_file : Optional Text
    , server_name : Optional Text
    , insecure_skip_verify : Optional Bool
    }
, default =
  { ca_file = None Text
  , cert_file = None Text
  , key_file = None Text
  , server_name = None Text
  , insecure_skip_verify = None Bool
  }
}

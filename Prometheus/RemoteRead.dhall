{ Type =
    { url : Optional Text
    , required_matchers : Optional (./Labels.dhall).Type
    , remote_timeout : Optional Text
    , read_recent : Optional Bool
    , basic_auth : Optional (./BasicAuth.dhall).Type
    , bearer_token : Optional Text
    , bearer_token_file : Optional Text
    , tls_config : Optional (./TlsConfig.dhall).Type
    , proxy_url : Optional Text
    }
, default =
  { url = None Text
  , required_matchers = None (./Labels.dhall).Type
  , remote_timeout = None Text
  , read_recent = None Bool
  , basic_auth = None (./BasicAuth.dhall).Type
  , bearer_token = None Text
  , bearer_token_file = None Text
  , tls_config = None (./TlsConfig.dhall).Type
  , proxy_url = None Text
  }
}

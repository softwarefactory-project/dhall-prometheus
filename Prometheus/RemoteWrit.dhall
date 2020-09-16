{ Type =
    { url : Optional Text
    , remote_timeout : Optional Text
    , write_relabel_configs : Optional (List (./RelabelConfig.dhall).Type)
    , basic_auth : Optional (./BasicAuth.dhall).Type
    , bearer_token : Optional Text
    , bearer_token_file : Optional Text
    , tls_config : Optional (./TlsConfig.dhall).Type
    , proxy_url : Optional Text
    , queue_config : Optional (./QueueConfig.dhall).Type
    }
, default =
  { url = None Text
  , remote_timeout = None Text
  , write_relabel_configs = None (List (./RelabelConfig.dhall).Type)
  , basic_auth = None (./BasicAuth.dhall).Type
  , bearer_token = None Text
  , bearer_token_file = None Text
  , tls_config = None (./TlsConfig.dhall).Type
  , proxy_url = None Text
  , queue_config = None (./QueueConfig.dhall).Type
  }
}

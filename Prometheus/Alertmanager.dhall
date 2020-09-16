{ Type =
    { timeout : Optional Text
    , api_version : Optional Text
    , path_prefix : Optional Text
    , scheme : Optional Text
    , basic_auth : Optional (./BasicAuth.dhall).Type
    , bearer_token : Optional Text
    , bearer_token_file : Optional Text
    , tls_config : Optional (./TlsConfig.dhall).Type
    , proxy_url : Optional Text
    , file_sd_configs : Optional (List (./FileSdConfig.dhall).Type)
    , static_configs : Optional (List (./StaticConfig.dhall).Type)
    , relabel_configs : Optional (List (./RelabelConfig.dhall).Type)
    }
, default =
  { timeout = None Text
  , api_version = None Text
  , path_prefix = None Text
  , scheme = None Text
  , basic_auth = None (./BasicAuth.dhall).Type
  , bearer_token = None Text
  , bearer_token_file = None Text
  , tls_config = None (./TlsConfig.dhall).Type
  , proxy_url = None Text
  , file_sd_configs = None (List (./FileSdConfig.dhall).Type)
  , static_configs = None (List (./StaticConfig.dhall).Type)
  , relabel_configs = None (List (./RelabelConfig.dhall).Type)
  }
}

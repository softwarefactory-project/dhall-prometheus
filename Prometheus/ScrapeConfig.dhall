{ Type =
    { job_name : Optional Text
    , scrape_interval : Optional Text
    , scrape_timeout : Optional Text
    , metrics_path : Optional Text
    , honor_labels : Optional Bool
    , honor_timestamps : Optional Bool
    , scheme : Optional Text
    , params : Optional (./Params.dhall).Type
    , basic_auth : Optional (./BasicAuth.dhall).Type
    , bearer_token : Optional Text
    , bearer_token_file : Optional Text
    , tls_config : Optional (./TlsConfig.dhall).Type
    , proxy_url : Optional Text
    , file_sd_configs : Optional (List (./FileSdConfig.dhall).Type)
    , static_configs : Optional (List (./StaticConfig.dhall).Type)
    , relabel_configs : Optional (List (./RelabelConfig.dhall).Type)
    , metric_relabel_configs : Optional (List (./RelabelConfig.dhall).Type)
    , sample_limit : Optional Natural
    }
, default =
  { job_name = None Text
  , scrape_interval = None Text
  , scrape_timeout = None Text
  , metrics_path = None Text
  , honor_labels = None Bool
  , honor_timestamps = None Bool
  , scheme = None Text
  , params = None (./Params.dhall).Type
  , basic_auth = None (./BasicAuth.dhall).Type
  , bearer_token = None Text
  , bearer_token_file = None Text
  , tls_config = None (./TlsConfig.dhall).Type
  , proxy_url = None Text
  , file_sd_configs = None (List (./FileSdConfig.dhall).Type)
  , static_configs = None (List (./StaticConfig.dhall).Type)
  , relabel_configs = None (List (./RelabelConfig.dhall).Type)
  , metric_relabel_configs = None (List (./RelabelConfig.dhall).Type)
  , sample_limit = None Natural
  }
}

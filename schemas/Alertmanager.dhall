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
    , azure_sd_configs : Optional (List (./AzureSdConfig.dhall).Type)
    , consul_sd_configs : Optional (List (./ConsulSdConfig.dhall).Type)
    , dns_sd_configs : Optional (List (./DnsSdConfig.dhall).Type)
    , ec2_sd_configs : Optional (List (./Ec2SdConfig.dhall).Type)
    , file_sd_configs : Optional (List (./FileSdConfig.dhall).Type)
    , gce_sd_configs : Optional (List (./GceSdConfig.dhall).Type)
    , kubernetes_sd_configs : Optional (List (./KubernetesSdConfig.dhall).Type)
    , marathon_sd_configs : Optional (List (./MarathonSdConfig.dhall).Type)
    , nerve_sd_configs : Optional (List (./NerveSdConfig.dhall).Type)
    , serverset_sd_configs : Optional (List (./ServersetSdConfig.dhall).Type)
    , triton_sd_configs : Optional (List (./TritonSdConfig.dhall).Type)
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
    , azure_sd_configs = None (List (./AzureSdConfig.dhall).Type)
    , consul_sd_configs = None (List (./ConsulSdConfig.dhall).Type)
    , dns_sd_configs = None (List (./DnsSdConfig.dhall).Type)
    , ec2_sd_configs = None (List (./Ec2SdConfig.dhall).Type)
    , file_sd_configs = None (List (./FileSdConfig.dhall).Type)
    , gce_sd_configs = None (List (./GceSdConfig.dhall).Type)
    , kubernetes_sd_configs = None (List (./KubernetesSdConfig.dhall).Type)
    , marathon_sd_configs = None (List (./MarathonSdConfig.dhall).Type)
    , nerve_sd_configs = None (List (./NerveSdConfig.dhall).Type)
    , serverset_sd_configs = None (List (./ServersetSdConfig.dhall).Type)
    , triton_sd_configs = None (List (./TritonSdConfig.dhall).Type)
    , static_configs = None (List (./StaticConfig.dhall).Type)
    , relabel_configs = None (List (./RelabelConfig.dhall).Type)
    }
}

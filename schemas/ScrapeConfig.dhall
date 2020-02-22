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
    , azure_sd_configs : Optional (List (./AzureSdConfig.dhall).Type)
    , consul_sd_configs : Optional (List (./ConsulSdConfig.dhall).Type)
    , dns_sd_configs : Optional (List (./DnsSdConfig.dhall).Type)
    , ec2_sd_configs : Optional (List (./Ec2SdConfig.dhall).Type)
    , openstack_sd_configs : Optional (List (./OpenstackSdConfig.dhall).Type)
    , file_sd_configs : Optional (List (./FileSdConfig.dhall).Type)
    , gce_sd_configs : Optional (List (./GceSdConfig.dhall).Type)
    , kubernetes_sd_configs : Optional (List (./KubernetesSdConfig.dhall).Type)
    , marathon_sd_configs : Optional (List (./MarathonSdConfig.dhall).Type)
    , nerve_sd_configs : Optional (List (./NerveSdConfig.dhall).Type)
    , serverset_sd_configs : Optional (List (./ServersetSdConfig.dhall).Type)
    , triton_sd_configs : Optional (List (./TritonSdConfig.dhall).Type)
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
    , azure_sd_configs = None (List (./AzureSdConfig.dhall).Type)
    , consul_sd_configs = None (List (./ConsulSdConfig.dhall).Type)
    , dns_sd_configs = None (List (./DnsSdConfig.dhall).Type)
    , ec2_sd_configs = None (List (./Ec2SdConfig.dhall).Type)
    , openstack_sd_configs = None (List (./OpenstackSdConfig.dhall).Type)
    , file_sd_configs = None (List (./FileSdConfig.dhall).Type)
    , gce_sd_configs = None (List (./GceSdConfig.dhall).Type)
    , kubernetes_sd_configs = None (List (./KubernetesSdConfig.dhall).Type)
    , marathon_sd_configs = None (List (./MarathonSdConfig.dhall).Type)
    , nerve_sd_configs = None (List (./NerveSdConfig.dhall).Type)
    , serverset_sd_configs = None (List (./ServersetSdConfig.dhall).Type)
    , triton_sd_configs = None (List (./TritonSdConfig.dhall).Type)
    , static_configs = None (List (./StaticConfig.dhall).Type)
    , relabel_configs = None (List (./RelabelConfig.dhall).Type)
    , metric_relabel_configs = None (List (./RelabelConfig.dhall).Type)
    , sample_limit = None Natural
    }
}

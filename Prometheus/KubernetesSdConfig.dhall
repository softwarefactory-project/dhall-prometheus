
{ Type =
    { api_server : Optional Text
    , role : Text
    , namespaces : Optional (./K8sNamespacesConfig.dhall).Type
    , basic_auth : Optional (./BasicAuth.dhall).Type
    , bearer_token : Optional Text
    , bearer_token_file : Optional Text
    , tls_config : Optional (./TlsConfig.dhall).Type
    , proxy_url : Optional Text
    }
, default =
   { role = "pod"
   }
}

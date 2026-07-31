let  k8s_namespaces_config =
    { Type =
        { own_namespace : Bool
        , names : Optional (List Text)
        }
    }

in { Type =
    { api_server : Optional Text
    , role : Text
    , namespaces : Optional k8s_namespaces_config.Type
    , basic_auth : Optional (./BasicAuth.dhall).Type
    , bearer_token : Optional Text
    , bearer_token_file : Optional Text
    , tls_config : Optional (./TlsConfig.dhall).Type
    , proxy_url : Optional Text
    }
, default =
   { targets = None (List Text)
   , labels = None (./Labels.dhall).Type
   }
}

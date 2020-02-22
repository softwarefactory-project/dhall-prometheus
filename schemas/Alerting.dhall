{ Type =
    { alert_relabel_configs : Optional (List (./RelabelConfig.dhall).Type)
    , alertmanagers : Optional (List (./Alertmanager.dhall).Type)
    }
, default =
    { alert_relabel_configs = None (List (./RelabelConfig.dhall).Type)
    , alertmanagers = None (List (./Alertmanager.dhall).Type)
    }
}

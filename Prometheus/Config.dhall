{ Type =
    { global : Optional (./Global.dhall).Type
    , rule_files : Optional (List Text)
    , remote_write : Optional (List (./RemoteWrit.dhall).Type)
    , remote_read : Optional (List (./RemoteRea.dhall).Type)
    , scrape_configs : Optional (List (./ScrapeConfig.dhall).Type)
    , alerting : Optional (./Alerting.dhall).Type
    }
, default =
  { global = None (./Global.dhall).Type
  , rule_files = None (List Text)
  , remote_write = None (List (./RemoteWrit.dhall).Type)
  , remote_read = None (List (./RemoteRea.dhall).Type)
  , scrape_configs = None (List (./ScrapeConfig.dhall).Type)
  , alerting = None (./Alerting.dhall).Type
  }
}

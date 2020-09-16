{ Type =
    { global : Optional (./Global.dhall).Type
    , rule_files : Optional (List Text)
    , remote_write : Optional (List (./RemoteWrite.dhall).Type)
    , remote_read : Optional (List (./RemoteRead.dhall).Type)
    , scrape_configs : Optional (List (./ScrapeConfig.dhall).Type)
    , alerting : Optional (./Alerting.dhall).Type
    }
, default =
  { global = None (./Global.dhall).Type
  , rule_files = None (List Text)
  , remote_write = None (List (./RemoteWrite.dhall).Type)
  , remote_read = None (List (./RemoteRead.dhall).Type)
  , scrape_configs = None (List (./ScrapeConfig.dhall).Type)
  , alerting = None (./Alerting.dhall).Type
  }
}

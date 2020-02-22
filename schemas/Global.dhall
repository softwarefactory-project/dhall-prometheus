{ Type =
    { scrape_interval : Optional Text
    , scrape_timeout : Optional Text
    , evaluation_interval : Optional Text
    , external_labels : Optional (./Labels.dhall).Type
    }
, default =
    { scrape_interval = None Text
    , scrape_timeout = None Text
    , evaluation_interval = None Text
    , external_labels = None (./Labels.dhall).Type
    }
}

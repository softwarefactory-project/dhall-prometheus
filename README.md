# dhall-prometheus

`dhall-prometheus` contains [Dhall][dhall-lang] bindings to [Prometheus][prometheus] configuration.
The schema is generated from json SchemaStore.

## Example

```dhall
-- ./examples/demo.dhall
let Prometheus = ../package.dhall

let web_monitor_list =
      [ "https://www.softwarefactory-project.io"
      , "https://softwarefactory-project.io/zuul/api/info"
      , "https://review.rdoproject.org/zuul/api/info"
      , "https://ovirt.softwarefactory-project.io/zuul/api/info"
      , "https://ansible.softwarefactory-project.io/zuul/api/info"
      ]

let host_list = [ "bridge:9100", "zuul:9100", "nodepool:9100" ]

in  Prometheus.Config::{
    , global = Some Prometheus.Global::{
      , scrape_interval = Some "1m"
      , scrape_timeout = Some "10s"
      , evaluation_interval = Some "1m"
      }
    , alerting = Some Prometheus.Alerting::{
      , alertmanagers = Some
        [ Prometheus.Alertmanager::{
          , path_prefix = Some "/alertmanager"
          , static_configs = Some
            [ Prometheus.StaticConfig::{ targets = Some [ "localhost:9093" ] } ]
          }
        ]
      }
    , scrape_configs = Some
      [ Prometheus.ScrapeConfig::{
        , job_name = Some "node"
        , static_configs = Some
          [ Prometheus.StaticConfig::{
            , targets = Some host_list
            , labels = Some (Prometheus.Labels.severity "critical")
            }
          ]
        }
      , Prometheus.ScrapeConfig::{
        , job_name = Some "blackbox"
        , static_configs = Some
          [ Prometheus.StaticConfig::{ targets = Some web_monitor_list } ]
        , scrape_interval = Some "5m"
        , metrics_path = Some "/probe"
        , params = Some Prometheus.Params::{ module = Some [ "http_2xx" ] }
        , relabel_configs = Some
          [ Prometheus.RelabelConfig::{
            , source_labels = Some [ "__address__" ]
            , target_label = Some "__param_target"
            }
          , Prometheus.RelabelConfig::{
            , source_labels = Some [ "__param_target" ]
            , target_label = Some "instance"
            }
          , Prometheus.RelabelConfig::{
            , target_label = Some "__address__"
            , replacement =
                let note = "# Blackbox exporter" in Some "127.0.0.1:9115"
            }
          ]
        }
      ]
    }

```

```yaml
# dhall-to-yaml --file examples/demo.dhall
alerting:
  alertmanagers:
    - path_prefix: /alertmanager
      static_configs:
        - targets:
            - localhost:9093
global:
  evaluation_interval: "1m"
  scrape_interval: "1m"
  scrape_timeout: "10s"
scrape_configs:
  - job_name: node
    static_configs:
      - labels:
          severity: critical
        targets:
          - bridge:9100
          - zuul:9100
          - nodepool:9100
  - job_name: blackbox
    metrics_path: /probe
    params:
      module:
        - http_2xx
    relabel_configs:
      - source_labels:
          - "__address__"
        target_label: "__param_target"
      - source_labels:
          - "__param_target"
        target_label: instance
      - replacement: "127.0.0.1:9115"
        target_label: "__address__"
    scrape_interval: "5m"
    static_configs:
      - targets:
          - https://www.softwarefactory-project.io
          - https://softwarefactory-project.io/zuul/api/info
          - https://review.rdoproject.org/zuul/api/info
          - https://ovirt.softwarefactory-project.io/zuul/api/info
          - https://ansible.softwarefactory-project.io/zuul/api/info

```

To define custom labels, use the `Labels.mapText` function or create your own [JSON/Type][JSON/Type]:

```
-- ./examples/labels.dhall
let Prometheus = ../package.dhall

in  Prometheus.Config::{
    , global = Some Prometheus.Global::{
      , external_labels = Some
          (Prometheus.Labels.mapText (toMap { my-label = "custom-value" }))
      }
    }

```

```yaml
# dhall-to-yaml --file examples/labels.dhall
global:
  external_labels:
    my-label: custom-value

```

[JSON/Type]: https://github.com/dhall-lang/dhall-lang/blob/master/Prelude/JSON/Type.dhall
[dhall-lang]: https://dhall-lang.org
[Prometheus]: https://prometheus.io

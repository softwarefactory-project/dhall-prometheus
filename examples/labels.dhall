let Prometheus = ../package.dhall

in  Prometheus.Config::{
    , global = Some Prometheus.Global::{
      , external_labels = Some
          (Prometheus.Labels.mapText (toMap { my-label = "custom-value" }))
      }
    }

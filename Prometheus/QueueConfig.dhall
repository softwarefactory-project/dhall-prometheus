{ Type =
    { capacity : Optional Natural
    , max_shards : Optional Natural
    , min_shards : Optional Natural
    , max_samples_per_send : Optional Natural
    , batch_send_deadline : Optional Text
    , min_backoff : Optional Text
    , max_backoff : Optional Text
    }
, default =
  { capacity = None Natural
  , max_shards = None Natural
  , min_shards = None Natural
  , max_samples_per_send = None Natural
  , batch_send_deadline = None Text
  , min_backoff = None Text
  , max_backoff = None Text
  }
}

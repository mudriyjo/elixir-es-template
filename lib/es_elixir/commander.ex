defmodule EsElixir.Commander do
  use Commanded.Application, otp_app: :es_elixir,
  event_store: [
    adapter: Commanded.EventStore.Adapters.EventStore,
    event_store: EsElixir.EventStore
  ]

  router EsElixir.Router
end

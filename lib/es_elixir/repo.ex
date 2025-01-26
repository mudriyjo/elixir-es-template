defmodule EsElixir.Repo do
  use Ecto.Repo,
    otp_app: :es_elixir,
    adapter: Ecto.Adapters.Postgres
end

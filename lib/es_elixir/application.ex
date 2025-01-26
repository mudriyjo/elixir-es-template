defmodule EsElixir.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false
  use Application

  @impl true
  def start(_type, _args) do
    children = [
      EsElixirWeb.Telemetry,
      EsElixir.Repo,
      {DNSCluster, query: Application.get_env(:es_elixir, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: EsElixir.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: EsElixir.Finch},
      # Start a worker by calling: EsElixir.Worker.start_link(arg)
      # {EsElixir.Worker, arg},
      # Start to serve requests, typically the last entry
      EsElixirWeb.Endpoint,
      EsElixir.Commander
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: EsElixir.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    EsElixirWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end

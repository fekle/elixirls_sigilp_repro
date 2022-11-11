defmodule ElixirlsSigilpRepro.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      ElixirlsSigilpReproWeb.Telemetry,
      # Start the Ecto repository
      ElixirlsSigilpRepro.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: ElixirlsSigilpRepro.PubSub},
      # Start Finch
      {Finch, name: ElixirlsSigilpRepro.Finch},
      # Start the Endpoint (http/https)
      ElixirlsSigilpReproWeb.Endpoint
      # Start a worker by calling: ElixirlsSigilpRepro.Worker.start_link(arg)
      # {ElixirlsSigilpRepro.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: ElixirlsSigilpRepro.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    ElixirlsSigilpReproWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end

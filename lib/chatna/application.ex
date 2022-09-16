defmodule Chatna.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Chatna.Repo,
      # Start the Telemetry supervisor
      ChatnaWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Chatna.PubSub},
      # Start the Endpoint (http/https)
      ChatnaWeb.Endpoint
      # Start a worker by calling: Chatna.Worker.start_link(arg)
      # {Chatna.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Chatna.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    ChatnaWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end

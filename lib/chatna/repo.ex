defmodule Chatna.Repo do
  use Ecto.Repo,
    otp_app: :chatna,
    adapter: Ecto.Adapters.Postgres
end

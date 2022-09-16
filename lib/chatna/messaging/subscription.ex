defmodule Chatna.Messaging.Subscription do
  use Ecto.Schema
  import Ecto.Changeset

  schema "subscriptions" do

    field :user_id, :id
    field :room_id, :id

    timestamps()
  end

  @doc false
  def changeset(subscription, attrs) do
    subscription
    |> cast(attrs, [])
    |> validate_required([])
  end
end

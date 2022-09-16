defmodule Chatna.Messaging.Room do
  use Ecto.Schema
  import Ecto.Changeset

  schema "rooms" do
    field :title, :string
    field :owner_id, :id

    timestamps()
  end

  @doc false
  def changeset(room, attrs) do
    room
    |> cast(attrs, [:title, :owner_id])
    |> validate_required([:title, :owner_id])
  end
end

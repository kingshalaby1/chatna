defmodule Chatna.MessagingFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Chatna.Messaging` context.
  """

  alias Chatna.AccountsFixtures
  @doc """
  Generate a room.


  """
  def room_fixture(attrs \\ %{}) do
    user = AccountsFixtures.user_fixture()
    {:ok, room} =
      attrs
      |> Enum.into(%{
        title: "some title",
        owner_id: user.id
      })
      |> Chatna.Messaging.create_room()

    room
  end

  @doc """
  Generate a message.
  """
  def message_fixture(attrs \\ %{}) do
    {:ok, message} =
      attrs
      |> Enum.into(%{
        body: "some body"
      })
      |> Chatna.Messaging.create_message()

    message
  end
end

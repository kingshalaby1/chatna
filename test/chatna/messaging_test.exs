defmodule Chatna.MessagingTest do
  use Chatna.DataCase

  alias Chatna.Messaging

  describe "rooms" do
    alias Chatna.Messaging.Room

    import Chatna.MessagingFixtures
    import Chatna.AccountsFixtures

    @invalid_attrs %{title: nil, owner_id: nil}

    test "list_rooms/0 returns all rooms" do
      room = room_fixture()
      assert Messaging.list_rooms() == [room]
    end

    test "get_room!/1 returns the room with given id" do
      room = room_fixture()
      assert Messaging.get_room!(room.id) == room
    end

    test "create_room/1 with valid data creates a room" do
      user = user_fixture()
      valid_attrs = %{title: "some title", owner_id: user.id}

      assert {:ok, %Room{} = room} = Messaging.create_room(valid_attrs)
      assert room.title == "some title"
    end

    test "create_room/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Messaging.create_room(@invalid_attrs)
    end

    test "update_room/2 with valid data updates the room" do
      room = room_fixture()
      update_attrs = %{title: "some updated title"}

      assert {:ok, %Room{} = room} = Messaging.update_room(room, update_attrs)
      assert room.title == "some updated title"
    end

    test "update_room/2 with invalid data returns error changeset" do
      room = room_fixture()
      assert {:error, %Ecto.Changeset{}} = Messaging.update_room(room, @invalid_attrs)
      assert room == Messaging.get_room!(room.id)
    end

    test "delete_room/1 deletes the room" do
      room = room_fixture()
      assert {:ok, %Room{}} = Messaging.delete_room(room)
      assert_raise Ecto.NoResultsError, fn -> Messaging.get_room!(room.id) end
    end

    test "change_room/1 returns a room changeset" do
      room = room_fixture()
      assert %Ecto.Changeset{} = Messaging.change_room(room)
    end
  end

  describe "messages" do
    alias Chatna.Messaging.Message

    import Chatna.MessagingFixtures

    @invalid_attrs %{body: nil}

    test "list_messages/0 returns all messages" do
      message = message_fixture()
      assert Messaging.list_messages() == [message]
    end

    test "get_message!/1 returns the message with given id" do
      message = message_fixture()
      assert Messaging.get_message!(message.id) == message
    end

    test "create_message/1 with valid data creates a message" do
      valid_attrs = %{body: "some body"}

      assert {:ok, %Message{} = message} = Messaging.create_message(valid_attrs)
      assert message.body == "some body"
    end

    test "create_message/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Messaging.create_message(@invalid_attrs)
    end

    test "update_message/2 with valid data updates the message" do
      message = message_fixture()
      update_attrs = %{body: "some updated body"}

      assert {:ok, %Message{} = message} = Messaging.update_message(message, update_attrs)
      assert message.body == "some updated body"
    end

    test "update_message/2 with invalid data returns error changeset" do
      message = message_fixture()
      assert {:error, %Ecto.Changeset{}} = Messaging.update_message(message, @invalid_attrs)
      assert message == Messaging.get_message!(message.id)
    end

    test "delete_message/1 deletes the message" do
      message = message_fixture()
      assert {:ok, %Message{}} = Messaging.delete_message(message)
      assert_raise Ecto.NoResultsError, fn -> Messaging.get_message!(message.id) end
    end

    test "change_message/1 returns a message changeset" do
      message = message_fixture()
      assert %Ecto.Changeset{} = Messaging.change_message(message)
    end
  end
end

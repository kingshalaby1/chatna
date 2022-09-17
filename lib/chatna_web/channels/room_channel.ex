defmodule ChatnaWeb.RoomChannel do
  use Phoenix.Channel
  alias Chatna.Messaging

  def join("room:lobby", _message, socket) do
    {:ok, socket}
  end

  def join("room:" <> _private_room_id, _params, _socket) do
    {:error, %{reason: "unauthorized"}}
  end

  def handle_in("new_msg", %{"body" => body, "room_id" => room_id} = m, socket) do
    IO.inspect(m)
    {:ok, msg} = Messaging.create_message(%{user_id: socket.assigns.current_user, body: body, room_id: room_id})
    broadcast!(socket, "server_msg", %{message: %{body: msg.body, user_id: msg.user_id, inserted_at: msg.inserted_at}, current_user_id: socket.assigns.current_user})
    {:noreply, socket}
  end
end

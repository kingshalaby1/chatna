defmodule ChatnaWeb.RoomChannel do
  use Phoenix.Channel
  alias Chatna.Messaging

  def join("room:lobby", _message, socket) do
    {:ok, socket}
  end

  def join("room:" <> _private_room_id, _params, _socket) do
    {:error, %{reason: "unauthorized"}}
  end

  def handle_in("new_msg", %{"body" => body} = m, socket) do
    IO.inspect(socket)
    # {:ok, msg} = Messaging.save_message(m)
    broadcast!(socket, "server_msg", %{body: body})
    {:noreply, socket}
  end
end

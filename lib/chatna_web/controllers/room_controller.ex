defmodule ChatnaWeb.RoomController do
  use ChatnaWeb, :controller
  alias Chatna.Messaging

  def index(conn, _params) do
    user = conn.assigns.current_user
    rooms = Messaging.list_user_rooms(user.id)
    render(conn, "index.html", [rooms: rooms])
  end


  def show(conn, %{"id" => id}) do
    user = conn.assigns.current_user
    rooms = Messaging.list_user_rooms(user.id)
    room = Messaging.get_room!(id)
    messages = Messaging.list_room_messages(room.id)

    render(conn, "show.html", [rooms: rooms, messages: messages, room_title: room.title, user: user])
  end
end

defmodule ChatnaWeb.PageController do
  use ChatnaWeb, :controller
  alias Chatna.Messaging

  def index(conn, _params) do
    user = conn.assigns.current_user
    rooms = Messaging.list_user_rooms(user.id)
    render(conn, "index.html", [rooms: rooms])
  end


end

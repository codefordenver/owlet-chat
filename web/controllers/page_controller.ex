
defmodule OwletChat.PageController do
  use OwletChat.Web, :controller

  @endpoint "https://owlet-users.firebaseio.com/users.json"

  def index(conn, params) do
    user_ids = Map.keys(elem(Poison.Parser.parse((HTTPotion.get @endpoint).body), 1))

    conn
    |> assign(:room, params["room"])
    |> assign(:users, user_ids)
    |> render("index.html")
  end
end

defmodule OwletChat.PageController do
  use OwletChat.Web, :controller

  @endpoint "https://owlet-users.firebaseio.com/users.json"

  def index(conn, params) do
    %{body: body} = HTTPotion.get @endpoint
    IO.puts(:Enum.map body, fn {k, v} -> v end)
    conn
    |> assign(:room, params["room"])
    |> render("index.html")
  end
end

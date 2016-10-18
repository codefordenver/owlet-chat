defmodule OwletChat.PageController do
  use OwletChat.Web, :controller

  def index(conn, params) do
    response = HTTPotion.get OwletChat.Endpoint.config(:owlet_users_endpoint)
    IO.puts(response.body)
    conn
    |> assign(:room, params["room"])
    |> render("index.html")
  end
end

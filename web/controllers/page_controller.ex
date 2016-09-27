defmodule OwletChat.PageController do
  use OwletChat.Web, :controller

  def index(conn, params) do
    conn
    |> assign(:room, params["room"])
    |> render("index.html")
  end
end

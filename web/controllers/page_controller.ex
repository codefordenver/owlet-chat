defmodule OwletChat.PageController do
  use OwletChat.Web, :controller

  def index(conn, params) do
    conn
    |> assign(:room_id, params["room_id"])
    |> assign(:user_id, params["user_id"])
    |> render("index.html")
  end
end

defmodule OwletChat.PageController do
  use OwletChat.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end

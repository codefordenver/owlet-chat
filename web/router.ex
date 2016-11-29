defmodule OwletChat.Router do
  use OwletChat.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers, %{"X-Frame-Options" =>
           "ALLOW-FROM #{Application.get_env(:owlet_chat, :owlet_ui_url)}"}
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", OwletChat do
    pipe_through :browser # Use the default browser stack

    get "/:user_id/:room_id", PageController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", OwletChat do
  #   pipe_through :api
  # end
end

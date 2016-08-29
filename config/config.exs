# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :owlet_chat,
  ecto_repos: [OwletChat.Repo]

# Configures the endpoint
config :owlet_chat, OwletChat.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "XTN3tRy0y6ZOUUIpXlbU6QVGOwkE/D6jHoU4ht2YiUaha5L9h0PQrTRmsmN0xPIT",
  render_errors: [view: OwletChat.ErrorView, accepts: ~w(html json)],
  pubsub: [name: OwletChat.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

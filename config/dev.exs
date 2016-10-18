use Mix.Config

# For development, we disable any cache and enable
# debugging and code reloading.
#
# The watchers configuration can be used to run external
# watchers to your application. For example, we use it
# with brunch.io to recompile .js and .css sources.
config :owlet_chat, OwletChat.Endpoint,
  http: [port: System.get_env("PORT") || 5000],
  debug_errors: true,
  code_reloader: true,
  check_origin: false,
  watchers: [node: ["node_modules/brunch/bin/brunch", "watch", "--stdin",
                    cd: Path.expand("../", __DIR__)]],
  owlet_users_endpoint: "https://owlet-users.firebaseio.com/presence.json"


# Watch static and templates for browser reloading.
config :owlet_chat, OwletChat.Endpoint,
  live_reload: [
    patterns: [
      ~r{priv/static/.*(js|css|png|jpeg|jpg|gif|svg)$},
      ~r{priv/gettext/.*(po)$},
      ~r{web/views/.*(ex)$},
      ~r{web/templates/.*(eex)$}
    ]
  ]

# URL for X-Frame-Options header to allow embedding in Owlet UI
# Use separate app config because endpoint config can't be used inside router
config :owlet_chat, owlet_ui_url: "http://localhost:4000"

# Do not include metadata nor timestamps in development logs
config :logger, :console, format: "[$level] $message\n"

# Set a higher stacktrace during development. Avoid configuring such
# in production as building large stacktraces may be expensive.
config :phoenix, :stacktrace_depth, 20

# Configure your database
config :owlet_chat, OwletChat.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "owlet_chat_dev",
  hostname: "localhost",
  pool_size: 10

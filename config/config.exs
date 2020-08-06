# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :metaito_project,
  ecto_repos: [MetaitoProject.Repo]

# Configures the endpoint
config :metaito_project, MetaitoProjectWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "KmHEgiZRl3MKsKPOjtIEQo7zucD8QI4VBednoNsrhbuHmYdfczqBGXgQ2IMXIJ+U",
  render_errors: [view: MetaitoProjectWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: MetaitoProject.PubSub,
  live_view: [signing_salt: "We0RA9Lc"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"

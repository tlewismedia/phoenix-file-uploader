# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :uploader,
  ecto_repos: [Uploader.Repo]

# Configures the endpoint
config :uploader, UploaderWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "l9TF+AfSl4agNHlQ7ZmnZh0wniF8157z6oj1lXt3qXnYDpbje9rXOVCOagoFLGQy",
  render_errors: [view: UploaderWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Uploader.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"

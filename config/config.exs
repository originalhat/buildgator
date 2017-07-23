# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :buildgator,
  ecto_repos: [Buildgator.Repo]

# Configures the endpoint
config :buildgator, Buildgator.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "C2wF9zuwLoEBISKaepOpeAsTN2QpQT3oPKgi/2msROKERvIQV1Fpz3VpXgiCHx1o",
  render_errors: [view: Buildgator.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Buildgator.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

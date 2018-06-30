# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :trak,
  ecto_repos: [Trak.Repo]

# Configures the endpoint
config :trak, TrakWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "SW3PrLJ/dN41WWiFs7LwvVl6qtHqTldB8MV9X/Exm27Prqw6t9AJynLDk20alBEv",
  render_errors: [view: TrakWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Trak.PubSub,
  adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

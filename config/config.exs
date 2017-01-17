# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :phoenix_recipe,
  ecto_repos: [PhoenixRecipe.Repo]

# Configures the endpoint
config :phoenix_recipe, PhoenixRecipe.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "bZHWeB4LRy5GT0h/zxvbYbwG0duIFrDWvh0v1hhVZKn71eAv1b7e3Yo9C0br+zdX",
  render_errors: [view: PhoenixRecipe.ErrorView, accepts: ~w(html json)],
  pubsub: [name: PhoenixRecipe.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

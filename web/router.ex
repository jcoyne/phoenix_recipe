defmodule PhoenixRecipe.Router do
  use PhoenixRecipe.Web, :router

  pipeline :browser do
    plug :accepts, ["html", "json"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  defp content_negotiation(conn, opts) do
    negotiate(conn, opts, Phoenix.Controller.get_format(conn))
  end

  defp negotiate(conn, opts, "html") do
    conn
    |> fetch_session(opts)
    |> fetch_flash(opts)
    |> protect_from_forgery(opts)
  end
  defp negotiate(conn, opts, _) do
    conn
  end

  pipeline :default do
    plug :accepts, ["html", "json"]
    plug :content_negotiation
  end

  scope "/", PhoenixRecipe do
    pipe_through :default
    resources "/recipes", RecipeController
  end


  # Other scopes may use custom stacks.
  # scope "/api", PhoenixRecipe do
  #   pipe_through :api
  # end
end

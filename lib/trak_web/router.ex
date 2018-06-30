defmodule TrakWeb.Router do
  use TrakWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end


  scope "/", TrakWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  scope "/api", TrakWeb do
    pipe_through :api

    resources "/foods", FoodController, except: [:new, :edit]
  end

  # Other scopes may use custom stacks.
  # scope "/api", TrakWeb do
  #   pipe_through :api
  # end
end

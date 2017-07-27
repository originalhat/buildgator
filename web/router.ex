defmodule Buildgator.Router do
  use Buildgator.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    # plug :protect_from_forgery # TODO: make this less terrible? what's the right way to handle incoming webhooks?
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Buildgator do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index

    resources "/builds", BuildController
  end

  # Other scopes may use custom stacks.
  # scope "/api", Buildgator do
  #   pipe_through :api
  # end
end

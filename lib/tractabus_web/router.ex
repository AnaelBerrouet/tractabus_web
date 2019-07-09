defmodule TractabusWeb.Router do
  use TractabusWeb, :router

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

  scope "/", TractabusWeb do
    pipe_through [:browser, TractabusWeb.Plugs.Guest]

    get "/login", SessionController, :new
    post "/login", SessionController, :create
  end

  scope "/", TractabusWeb do
    pipe_through :browser

    get "/", PageController, :index

    pipe_through TractabusWeb.Plugs.Auth

    delete "/logout", SessionController, :delete

    resources "/profile", UserController
    resources "/user", UserController, only: [:index, :show]
    resources "/articles", ArticleController, only: [:index, :show]
  end

  # Other scopes may use custom stacks.
  # scope "/api", TractabusWeb do
  #   pipe_through :api
  # end
end

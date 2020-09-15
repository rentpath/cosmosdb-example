defmodule CosmosdbExWeb.Router do
  use CosmosdbExWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", CosmosdbExWeb do
    pipe_through :api
    get "/:collection", Controller, :index
  end

  scope "/", CosmosdbExWeb do
    pipe_through :api
    get "/*path", Controller, :error
  end
end

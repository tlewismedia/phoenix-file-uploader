defmodule UploaderWeb.Router do
  use UploaderWeb, :router

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

  scope "/", UploaderWeb do
    pipe_through :browser

    resources "/uploads", UploadController, only: [:index, :new, :create, :show]
  end
end

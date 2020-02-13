defmodule UploaderWeb.PageController do
  use UploaderWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end

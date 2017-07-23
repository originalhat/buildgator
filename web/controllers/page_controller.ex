defmodule Buildgator.PageController do
  use Buildgator.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end

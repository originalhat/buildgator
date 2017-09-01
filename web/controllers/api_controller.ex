defmodule Buildgator.ApiController do
  use Buildgator.Web, :controller

  alias Buildgator.Build

  def builds(conn, _params) do
    builds =
      Repo.all(Build)
      |> Enum.map(fn(build) -> build.build end)
      |> Enum.reverse

    IO.inspect(builds)
    render(conn, "builds.json", builds: builds)
  end
end
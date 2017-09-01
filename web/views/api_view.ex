defmodule Buildgator.ApiView do
  use Buildgator.Web, :view

  #  hot ass pattern matching by maor
  def render("builds.json", %{builds: builds}) do
    IO.inspect builds
#    %{"builds" => builds}
  end
end

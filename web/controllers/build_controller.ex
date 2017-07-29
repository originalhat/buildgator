defmodule Buildgator.BuildController do
  use Buildgator.Web, :controller

  alias Buildgator.Build

  def index(conn, _params) do
    builds = Enum.reverse(Repo.all(Build))
    render(conn, "index.html", builds: builds)
  end

  def new(conn, _params) do
    changeset = Build.changeset(%Build{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, build_params) do
    # FIXME: don't blindly pass params into the DB
    changeset = Build.changeset(%Build{build: build_params})

    case Repo.insert(changeset) do
      {:ok, _build} ->
        conn
        |> put_resp_header("content-type", "application/json; charset=utf-8")
        |> send_resp(200, Poison.encode!(build_params))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    build = Repo.get!(Build, id)
    render(conn, "show.html", build: build)
  end

  def edit(conn, %{"id" => id}) do
    build = Repo.get!(Build, id)
    changeset = Build.changeset(build)
    render(conn, "edit.html", build: build, changeset: changeset)
  end

  def update(conn, %{"id" => id, "build" => build_params}) do
    build = Repo.get!(Build, id)
    changeset = Build.changeset(build, build_params)

    case Repo.update(changeset) do
      {:ok, build} ->
        conn
        |> put_flash(:info, "Build updated successfully.")
        |> redirect(to: build_path(conn, :show, build))
      {:error, changeset} ->
        render(conn, "edit.html", build: build, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    build = Repo.get!(Build, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(build)

    conn
    |> put_flash(:info, "Build deleted successfully.")
    |> redirect(to: build_path(conn, :index))
  end
end

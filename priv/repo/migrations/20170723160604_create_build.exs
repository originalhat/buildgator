defmodule Buildgator.Repo.Migrations.CreateBuild do
  use Ecto.Migration

  def change do
    create table(:builds) do
      add :build, :jsonb

      timestamps()
    end

  end
end

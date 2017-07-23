defmodule Buildgator.Build do
  use Buildgator.Web, :model

  schema "builds" do
    field :build, :map

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:build])
    |> validate_required([:build])
  end
end

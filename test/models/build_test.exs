defmodule Buildgator.BuildTest do
  use Buildgator.ModelCase

  alias Buildgator.Build

  @valid_attrs %{build: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Build.changeset(%Build{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Build.changeset(%Build{}, @invalid_attrs)
    refute changeset.valid?
  end
end

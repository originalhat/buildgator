# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Buildgator.Repo.insert!(%Buildgator.SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

Enum.each  Path.wildcard("priv/repo/fixtures/*.json"), fn fixture ->
  Buildgator.Repo.insert!(%Buildgator.Build{build: Poison.decode!(File.read!(fixture))})
end


# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Trak.Repo.insert!(%Trak.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

# alias my repo
alias Trak.Repo
alias Trak.Ingredient.Food

#Create Foods
for _index <- 1..20 do
  food = Repo.insert!( %Food{ name: FakerElixir.Name.name } )
end

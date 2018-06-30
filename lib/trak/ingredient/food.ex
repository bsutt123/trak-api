defmodule Trak.Ingredient.Food do
  use Ecto.Schema
  import Ecto.Changeset


  schema "foods" do
    field :name, :string
    timestamps()
  end

  @doc false
  def changeset(food, attrs) do
    food
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end

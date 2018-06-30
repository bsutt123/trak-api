defmodule Trak.IngredientTest do
  use Trak.DataCase

  alias Trak.Ingredient

  describe "foods" do
    alias Trak.Ingredient.Food

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def food_fixture(attrs \\ %{}) do
      {:ok, food} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Ingredient.create_food()

      food
    end

    test "list_foods/0 returns all foods" do
      food = food_fixture()
      assert Ingredient.list_foods() == [food]
    end

    test "get_food!/1 returns the food with given id" do
      food = food_fixture()
      assert Ingredient.get_food!(food.id) == food
    end

    test "create_food/1 with valid data creates a food" do
      assert {:ok, %Food{} = food} = Ingredient.create_food(@valid_attrs)
    end

    test "create_food/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Ingredient.create_food(@invalid_attrs)
    end

    test "update_food/2 with valid data updates the food" do
      food = food_fixture()
      assert {:ok, food} = Ingredient.update_food(food, @update_attrs)
      assert %Food{} = food
    end

    test "update_food/2 with invalid data returns error changeset" do
      food = food_fixture()
      assert {:error, %Ecto.Changeset{}} = Ingredient.update_food(food, @invalid_attrs)
      assert food == Ingredient.get_food!(food.id)
    end

    test "delete_food/1 deletes the food" do
      food = food_fixture()
      assert {:ok, %Food{}} = Ingredient.delete_food(food)
      assert_raise Ecto.NoResultsError, fn -> Ingredient.get_food!(food.id) end
    end

    test "change_food/1 returns a food changeset" do
      food = food_fixture()
      assert %Ecto.Changeset{} = Ingredient.change_food(food)
    end
  end
end

defmodule TrakWeb.FoodControllerTest do
  use TrakWeb.ConnCase

  alias Trak.Ingredient
  alias Trak.Ingredient.Food

  @create_attrs %{}
  @update_attrs %{}
  @invalid_attrs %{}

  def fixture(:food) do
    {:ok, food} = Ingredient.create_food(@create_attrs)
    food
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all foods", %{conn: conn} do
      conn = get conn, food_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create food" do
    test "renders food when data is valid", %{conn: conn} do
      conn = post conn, food_path(conn, :create), food: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, food_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, food_path(conn, :create), food: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update food" do
    setup [:create_food]

    test "renders food when data is valid", %{conn: conn, food: %Food{id: id} = food} do
      conn = put conn, food_path(conn, :update, food), food: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, food_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id}
    end

    test "renders errors when data is invalid", %{conn: conn, food: food} do
      conn = put conn, food_path(conn, :update, food), food: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete food" do
    setup [:create_food]

    test "deletes chosen food", %{conn: conn, food: food} do
      conn = delete conn, food_path(conn, :delete, food)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, food_path(conn, :show, food)
      end
    end
  end

  defp create_food(_) do
    food = fixture(:food)
    {:ok, food: food}
  end
end

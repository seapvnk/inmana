defmodule InmanaWeb.RestaurantsControllerTest do
  use InmanaWeb.ConnCase

  describe "create/2" do
    test "when all params are valid, creates the restaurant", %{conn: conn} do
      params = %{name: "Restaurante Delicinha", email: "contato@delicinha.com.br"}

      response =
        conn
        |> post(Routes.restaurants_path(conn, :create, params))
        |> json_response(:created)

      assert %{
          "message" => "Restaurant created!",
          "restaurant" => %{
            "email" => "contato@delicinha.com.br",
            "name" => "Restaurante Delicinha",
            "id" => _id,
          }
        } = response
    end

    test "when there are invalid, returns an error", %{conn: conn} do
      params = %{name: "a", email: ""}

      expected = %{"message" => %{"email" => ["can't be blank"], "name" => ["should be at least 2 character(s)"]}}

      response =
        conn
        |> post(Routes.restaurants_path(conn, :create, params))
        |> json_response(:bad_request)

      assert expected == response
    end
  end
end

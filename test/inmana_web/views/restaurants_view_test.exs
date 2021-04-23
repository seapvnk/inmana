defmodule InmanaWeb.RestaurantsViewTest do
  use InmanaWeb.ConnCase

  alias InmanaWeb.RestaurantsView
  alias Inmana.Restaurant

  import Phoenix.View

  describe "render/2" do
    test "renders create.json" do
      params = %{name: "Restaurante Delicinha", email: "contato@delicinha.com.br"}
      {:ok, restaurant} = Inmana.create_restaurant(params)

      response = render(RestaurantsView, "create.json", restaurant: restaurant)

      assert %{
          message: "Restaurant created!",
          restaurant: %Restaurant{
            email: "contato@delicinha.com.br",
            id: _id,
            name: "Restaurante Delicinha",
          }
        } = response
    end
  end
end

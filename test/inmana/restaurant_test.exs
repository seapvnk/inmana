defmodule Inmana.RestaurantTest do
  use Inmana.DataCase

  alias Inmana.Restaurant
  alias Ecto.Changeset

  describe "changeset/1" do
    test "when all params are valid, return a valid changeset" do
      params = %{name: "Restaurante Delicinha", email: "contato@delicinha.com.br"}

      response = Restaurant.changeset(params)
      assert %Changeset{changes:
        %{name: "Restaurante Delicinha", email: "contato@delicinha.com.br"},
        valid?: true
      } = response
    end

    test "when there are invalid, return an invalid changeset" do
      params = %{name: "2", email: ""}

      response = Restaurant.changeset(params)

      expected_response = %{
        name: ["should be at least 2 character(s)"],
        email: ["can't be blank"]
      }

      assert %Changeset{valid?: false} = response
      assert errors_on(response) == expected_response
    end
  end
end

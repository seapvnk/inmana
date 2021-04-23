defmodule Inmana.WelcomerTest do
  use ExUnit.Case

  alias Inmana.Welcomer

  describe "welcome/1" do
    test "when the user is special, return a special message" do
      params = %{"name" => "pedro", "age" => "19"}

      expected_result = {:ok, "You're special!"}
      result = Welcomer.welcome(params)

      assert result == expected_result
    end

    test "when the user is not special, return a message" do
      params = %{"name" => "jose", "age" => "20"}

      expected_result = {:ok, "Welcome jose, you're not special"}
      result = Welcomer.welcome(params)

      assert result == expected_result
    end

    test "when the user is under age, return an error" do
      params = %{"name" => "rafael", "age" => "14"}

      expected_result = {:error, "You shall not pass rafael"}
      result = Welcomer.welcome(params)

      assert result == expected_result
    end
  end
end

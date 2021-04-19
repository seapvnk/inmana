defmodule Inmana.Welcomer do

  def welcome(%{"name" => name, "age" => age}) do
    name
    |> String.trim
    |> String.downcase
    |> evaluate(age |> String.to_integer)
  end

  defp evaluate("pedro", 19) do
    {:ok, "You're special!"}
  end

  defp evaluate(name, age) when age >= 18 do
    {:ok, "Welcome #{name}, you're not special"}
  end

  defp evaluate(name, _age) do
    {:error, "You shall not pass #{name}"}
  end

end

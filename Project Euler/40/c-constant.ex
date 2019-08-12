defmodule CConstant do
  def find do
    lst = 1..300_000
    |> Enum.map(fn x -> Integer.to_string x end)
    |> List.to_string
    |> String.split("")
    |> List.delete_at(0)
    |> List.delete_at(-1)

    [0, 9, 99, 999, 9_999, 99_999, 999_999]
    |> Enum.reduce(1, fn x, res -> res * String.to_integer(Enum.at lst, x) end)
  end
end

CConstant.find
|> IO.puts

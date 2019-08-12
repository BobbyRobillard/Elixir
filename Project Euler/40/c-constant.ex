defmodule CConstant do
  def find do
    lst = 1..200_000
    |> Enum.join
    |> String.split("", trim: true)

    [0, 9, 99, 999, 9_999, 99_999, 999_999]
    |> Enum.reduce(1, fn x, res -> res * String.to_integer(Enum.at lst, x) end)
  end
end

CConstant.find
|> IO.puts

defmodule SquareRoot do

  def run, do: convergents(0, 3, 2, 0)

  def convergents(1001, _n, _d, res), do: res

  def convergents(at, n, d, res) do
    n = n + (2 * d)
    d = n - d

    mapped = [n, d]
    |> Enum.map(fn x -> String.length(Integer.to_string x) end)

    if Enum.at(mapped, 0) > Enum.at(mapped, 1) do
      convergents(at + 1, n, d, res + 1)
    else
      convergents(at + 1, n, d, res)
    end
  end

end

SquareRoot.run
|> IO.puts

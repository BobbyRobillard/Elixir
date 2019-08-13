defmodule IntegerTriangles do

  def find(n), do: find(n, 0)

  def _find(2, max), do: max

  def _find(n, max) do
    2..n/3
    |>

  end
end

IntegerTriangles.find
|> IO.puts

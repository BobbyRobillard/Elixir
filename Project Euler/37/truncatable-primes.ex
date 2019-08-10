defmodule Truncatable do

  def primes do
    1..100
    |> Enum.reduce([], fn x, acc -> (if ! has_factors(x) or x == 2 do acc ++ [x] else acc end) end)
    |> Enum.reduce([], fn x, acc -> (if is_truncatable(x) do acc ++ [x] else acc end) end)
    |> Enum.sum
  end

  def is_truncatable(_x) do
    :true
  end

  defp has_factors(x) do
     2..round(:math.sqrt(x))
     |> Enum.any?(fn n -> rem(x, n) == 0 end)
  end

end

Truncatable.primes
# |> IO.puts

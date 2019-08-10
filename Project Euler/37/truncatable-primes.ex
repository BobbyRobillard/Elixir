defmodule Truncatable do

  def primes do
    1..100
    |> Enum.reduce([], fn x, acc -> (if ! has_factors(x) or x == 2 do acc ++ [x] else acc end) end)
    |> Enum.reduce([], fn x, acc -> (if is_truncatable(x) do acc ++ [x] else acc end) end)
    |> Enum.sum
  end

  def is_truncatable(x) do
    if left_to_right(x) and right_to_left(x) do
      :true
    else
      :false
    end
  end

  defp has_factors(x) do
     2..round(:math.sqrt(x))
     |> Enum.any?(fn n -> rem(x, n) == 0 end)
  end

  def left_to_right(_x) do
    :true
  end

  def right_to_left(_x) do
    :true
  end

end

Truncatable.primes
|> IO.puts

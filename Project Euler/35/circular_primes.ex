defmodule CircularPrime do
  def find_amount do
    x =
    2..100
    |> Enum.map_reduce([], fn n, acc -> is_prime(n, acc) end)
    |> elem(1)
    |> Enum.map_reduce([], fn n, acc -> is_circular(n, acc) end)
    |> elem(1)
    IO.inspect binding()
    # |> Enum.sum
  end

  defp is_prime(x, acc) do
    case find_factors x do
      [] -> {x, acc ++ [x]}
       _ -> {x, acc}
    end
  end

  defp is_circular(x, acc) do {x, acc ++ [x]} end

  defp find_factors(num), do: _find_factors(num, 2, [])

  defp _find_factors(num, at, factors) do
    if at > :math.sqrt(num) do
      factors
    else
      if rem(num, at) != 0 do # Not a factor
        _find_factors(num, at + 1, factors)
      else
        if num/at == at do
          _find_factors(num, at + 1, factors ++ [at])
        else
          _find_factors(num, at + 1, factors ++ [at, num/at])
        end
      end
    end
  end
end

# Main execution of the program
CircularPrime.find_amount
# |> IO.puts

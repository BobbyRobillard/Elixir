defmodule CircularPrime do
  def find_amount do
    x =
    2..1_000_000
    |> Enum.map_reduce([], fn n, acc -> add_if_prime(n, acc) end)
    |> elem(1)
    |> Enum.map_reduce([], fn n, acc -> add_if_circular(n, acc) end)
    |> elem(1)
    IO.inspect binding()
    # |> Enum.sum
  end

  defp add_if_prime(x, acc) do
     case has_factors x do
        :false -> {x, acc ++ [x]}
        :true -> {x, acc}
     end
  end

  defp add_if_circular(x, acc) do {x, acc ++ [x]} end

  defp has_factors(x) do
     if rem(x, 2) == 0 or rem(x, 3) == 0
       or rem(x, 5) == 0 or rem(x, 7) == 0 do
         :true
     else
        case find_factors(x) do
        [] -> :false
        _  -> :true
      end
    end
  end

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

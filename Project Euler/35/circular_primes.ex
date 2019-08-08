defmodule CircularPrime do
  def find_amount do
    x =
    2..100
    |> Enum.map_reduce([], fn n, acc -> (
                              if is_prime(n) do
                                {n, acc ++ [n]}
                              else {n, acc} end
                           ) end
                       ) # Get all primes below a number
    |> elem(1)
    |> Enum.map_reduce([], fn n, acc -> (
                              if is_circular(n) do
                                {n, acc ++ [n]}
                              else {n, acc} end
                          ) end
    )
    |> elem(1)
    IO.inspect binding()
    # |> Enum.sum
  end

    case find_factors x do
      [] -> :true
      _  -> :false
    end
  end

  defp is_circular(x) do :true end

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

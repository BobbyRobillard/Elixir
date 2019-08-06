defmodule LargestPrime do

  defp find_factors(num), do: _find_factors(num, 2, [])

  defp _find_factors(num, at, factors) when at > num/2, do: factors

  defp _find_factors(num, at, factors) do
    if rem(num, at) == 0 do # Is a factor
      _find_factors(num, at + 1, factors ++ [at])
    else
      _find_factors(num, at + 1, factors)
    end
  end

  defp is_prime(num) do
    case find_factors(num) do
      [] -> True
      [_head|_tail]  -> False
    end
  end

  defp find_largest_prime([]), do: "No Primes"

  defp find_largest_prime([head|tail]) do
    case is_prime(head) do
      True -> head
      False -> find_largest_prime(tail)
    end
  end

  def find(num) do
    find_factors(num)
    |> Enum.sort(&(&1 > &2))
    |> find_largest_prime
    |> IO.puts
  end
end


# 1) Determine the factors of a number
# 2) Determine all the prime factors up to the largest factor
# 3) Sort the list of prime factors and return the largest
IO.gets("Number to find largest prime of: ")
|> String.trim
|> String.to_integer
|> LargestPrime.find
|> IO.puts

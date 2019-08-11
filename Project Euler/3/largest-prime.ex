defmodule LargestPrime do
  # ----------------------------------------------------------
  defp find_factors(num), do: _find_factors(num, 2, [])

  defp _find_factors(num, at, factors) do
    # Functions with potential exceptions can't be used as guard clauses
    # ------------------------------------------------------------------
    # Cool little trick to reduce execution time
    # https://www.youtube.com/watch?v=oFahMlzI-Ic
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
  # ----------------------------------------------------------
  defp get_largest_prime([]), do: "No Primes"

  defp get_largest_prime([head|tail]) do
    case find_factors(Kernel.trunc(head)) do # Check if head is prime
      [] -> head
      _ -> get_largest_prime(tail)
    end
  end
  # ----------------------------------------------------------
  def find(num) do # Find largest prime
    find_factors(num)
    |> Enum.sort(&(&1 > &2))
    |> get_largest_prime
    |> IO.puts
  end
end

# Main execution of the program
IO.gets("Number to find largest prime of: ")
|> String.trim |> String.to_integer |> LargestPrime.find
|> IO.puts

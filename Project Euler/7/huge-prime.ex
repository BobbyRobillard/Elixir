defmodule Prime do

  # ----------------------------------------------------------
  defp find_factors(num), do: _find_factors(num, 2, [])

  defp _find_factors(num, at, factors) do
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
  def find(num), do: _find(num, 2, 0)

  def _find(num, curr, num_primes) do
    case find_factors(curr) do # Check if curr is prime
      [] ->   (if num_primes + 1 == num do
                curr
              else
                _find(num, curr + 1, num_primes + 1)
              end)
      _ -> _find(num, curr + 1, num_primes)
    end
  end
  # ----------------------------------------------------------
end

# Main execution of the program
IO.gets("Find which prime: ")
|> String.trim |> String.to_integer |> Prime.find
|> IO.puts

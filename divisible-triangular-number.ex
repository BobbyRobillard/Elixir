defmodule DivisibleTriangular do

  def find_factors(num), do: _find_factors(num, 1, [])

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

  def find(num_divisors), do: _find(num_divisors, 1, 0)

  defp _find(num_divisors, curr, curr_sum) do
    # IO.inspect binding()
    new_sum = curr + curr_sum
    factors = find_factors new_sum
    num_factors = Enum.count factors
    if num_factors == num_divisors do
      new_sum
    else
      _find(num_divisors, curr + 1, new_sum)
    end

  end

end

# Main execution of the program
IO.gets("How many divisors?: ")
|> String.trim |> String.to_integer |> DivisibleTriangular.find
|> IO.puts

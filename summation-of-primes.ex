defmodule SumPrime do
  # ------------------------------------------------------------------
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
  # ------------------------------------------------------------------
  def find(1, result), do: Enum.sum result

  def find(num, result) do
    case find_factors(num) do
      [] -> find(num - 1, result ++ [num])
      _  -> find(num - 1, result)
    end
  end
  # ------------------------------------------------------------------
end

IO.gets("Max Value: ")
|> String.trim
|> String.to_integer
|> SumPrime.find([])
|> IO.puts

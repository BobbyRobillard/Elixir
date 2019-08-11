defmodule ConsecutivePrime do
  def sum do
    primes = 2..100
    |> Enum.reduce([], fn x, acc ->
        (if ! has_factors(x) do acc ++ [x] else acc end) end)
    longest_consecutive(primes, 0, primes)
  end

  defp has_factors(x) do
      if x == 2 do
        :false
      else
        2..round(:math.sqrt(x))
        |> Enum.any?(fn n -> rem(x, n) == 0 end)
      end
  end

  def longest_consecutive([], longest_sum, _primes), do: longest_sum

  def longest_consecutive([head|tail], longest_sum, primes) do
      if length_consecutive(head, primes) > longest_sum do
        longest_consecutive(tail, head, primes)
      else
        longest_consecutive(tail, longest_sum, primes)
      end
  end

  def length_consecutive(_num, _primes) do
    5
  end
end

ConsecutivePrime.sum
|> IO.puts

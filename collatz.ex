defmodule Collatz do
  def longest(input), do: _longest(input, 0, 0)

  defp _longest(0, max_num, _max_length), do: max_num

  defp _longest(at, max_num, max_length) do
    c_length = collatz_length at, 1
    if c_length > max_length do
      _longest(at - 1, at, c_length)
    else
      _longest(at - 1, max_num, max_length)
    end
  end

  defp collatz_length(1.0, length), do: length

  defp collatz_length(term, length) do
    if rem(Kernel.trunc(term), 2) != 0 or term == 0 do
      collatz_length((3 * term) + 1, length + 1)
    else
      collatz_length(term/2, length + 1)
    end
  end

end

# Main execution of the program
IO.gets("Number to find longest chain of: ")
|> String.trim
|> String.to_integer
|> Collatz.longest
|> IO.puts

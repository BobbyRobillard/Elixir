defmodule GreatestSum do

  def find_greatest_sum(input), do: _find_greatest_sum(input, 0)

  def _find_greatest_sum("", greatest), do: greatest

  def _find_greatest_sum(input, greatest) do
    output =
    input
    # Split string, delete extra "" chars.
    |> String.slice(0..12)
    |> String.split("")
    |> List.delete_at(0)
    |> List.delete_at(-1)
    # Find the sum
    |> Enum.map(&(String.to_integer &1))
    |> Enum.map_reduce(1, fn a, acc -> {a, a * acc} end)
    |> elem(1)

    _find_greatest_sum(
      String.slice(input, 1..-1),
      Enum.max([output, greatest])
    )
  end

end

# Main execution of the program
IO.gets("Number to find greatest sum of: ")
|> String.trim
|> GreatestSum.find_greatest_sum
|> IO.puts

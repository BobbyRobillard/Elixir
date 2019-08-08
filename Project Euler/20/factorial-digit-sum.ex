defmodule FactorialDigit do
  def sum(n) do
    1..n # Create list 1 -> n
    |> Enum.map_reduce(1, fn a, acc -> {a, a * acc} end) # Multiply items in list
    |> elem(1)
    |> Integer.to_string
    |> String.split("")
    |> List.delete_at(0) |> List.delete_at(-1) # Remove extra "chars"
    |> Enum.map_reduce(0, fn a, acc -> {a, String.to_integer(a) + acc} end)
    |> elem(1)
  end
end

# Main execution of the program
IO.gets("Factorial Digit Sum Of?: ")
|> String.trim |> String.to_integer |> FactorialDigit.sum
|> IO.puts

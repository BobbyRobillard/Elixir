defmodule PowerDigit do
  def sum(number) do
    Kernel.trunc(:math.pow(number, 15))
    |> Integer.to_string
  end
end

# Main execution of the program
IO.gets("Find find of what?: ")
|> String.trim
|> String.to_integer
|> PowerDigit.sum
|> IO.puts

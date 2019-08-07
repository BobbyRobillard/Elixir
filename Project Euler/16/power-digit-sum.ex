defmodule PowerDigit do
  def sum(number) do
    Kernel.trunc(:math.pow(number, 1000)) # 2.0^1000 -> 2^1000
    |> Integer.to_string # 1234 -> "1234"
    |> String.split("") # "1234" -> ["", "1", "2", "3", "4", ""]
    |> List.delete_at(0) # Delete excess "" element in list
    |> List.delete_at(-1) # Delete excess "" element in list
    |> Enum.map(fn input -> String.to_integer(input) end) # "2" -> 2
    |> Enum.sum # 2 + 2 + 2 = 6
  end
end

# Main execution of the program
IO.gets("Find power digit sum of what to the power of 1000?: ")
|> String.trim
|> String.to_integer
|> PowerDigit.sum
|> IO.puts

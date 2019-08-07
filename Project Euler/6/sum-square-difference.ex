defmodule SumSquare do
  def find_difference(input) do
    sum_of_squares =
    1..input
    |> Enum.map(&(&1 * &1))
    |> Enum.sum

    square_of_sum = :math.pow(Enum.sum(1..input), 2)

    square_of_sum - sum_of_squares
  end
end

# Main execution of the program
IO.gets("Number to find sum square of: ")
|> String.trim
|> String.to_integer
|> SumSquare.find_difference
|> IO.puts

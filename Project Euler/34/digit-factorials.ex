defmodule DigitFactorial do

  def run(n) do
    3..n
    |> Enum.reduce(0, fn x, acc -> (if x == sum_digit_factorials(x) do acc + x
                                    else acc end) end)
  end

  def sum_digit_factorials(n) do
    Integer.to_string(n)
    |> String.split("")
    |> List.delete_at(0)
    |> List.delete_at(-1)
    |> Enum.map(&(factorial(String.to_integer &1)))
    |> Enum.sum
  end

  def factorial(n) do
    1..n
    |> Enum.reduce(1, fn x, acc -> acc * x end)
  end

end

DigitFactorial.run(1_000_000)
|> IO.puts

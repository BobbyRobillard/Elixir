defmodule DigitFactorial do

  def run(n), do: _run(n, [])

  def _run(2, result) do
    Enum.sum(result)
  end

  def _run(n, result) do
    if n == Enum.sum(digit_factorials n) do
      _run(n - 1, result ++ [n])
    else
      _run(n - 1, result)
    end
  end

  def digit_factorials(n) do
    Integer.to_string(n)
    |> String.split("")
    |> List.delete_at(0)
    |> List.delete_at(-1)
    |> Enum.map(&(factorial(String.to_integer &1)))
  end

  def factorial(0), do: 1

  def factorial(n) when n > 0 do
    n * factorial(n - 1)
  end

end

DigitFactorial.run(9_999_999)
|> IO.puts

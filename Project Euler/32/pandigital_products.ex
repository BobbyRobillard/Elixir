defmodule PandigitalProducts do
  def sum do
    1..2000
    |> Enum.reduce([], fn x, acc -> acc ++ pandigital(x) end)
    |> Enum.uniq
    |> Enum.sum
  end

  def pandigital(input) do
    1..2000
    |> Enum.reduce([], fn x, acc -> (if check_sum(input, x) do acc ++ [x * input] else acc end) end)
  end

  def check_sum(input, x) do
    digits = [input * x, input, x]
    |> Enum.join
    |> String.split("", trim: true)
    |> Enum.sort


    if Enum.count(digits) == 9 do
      valid_pandigital = 1..9
      |> Enum.join
      |> String.split("", trim: true)

      if valid_pandigital == digits do
        :true
      else
        :false
      end

    else
      :false
    end

  end

end

PandigitalProducts.sum
|> IO.puts

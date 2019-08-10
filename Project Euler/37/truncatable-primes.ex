defmodule Truncatable do

  def primes do
    11..1000000
    |> Enum.reduce([], fn x, acc -> (if ! has_factors(x) or x == 2 do acc ++ [x] else acc end) end)
    |> Enum.reduce([], fn x, acc -> (if is_truncatable(x) do acc ++ [x] else acc end) end)
    |> Enum.sum
  end

  def is_truncatable(x) do
    if left_to_right(x) and right_to_left(x) do
      :true
    else
      :false
    end
  end

  defp has_factors(x) do
    if x == 1 do
      :true
    end
    if x == 2 or x == 3 or x == 5 or x == 7 do
      :false
    else
      2..round(:math.sqrt(x))
      |> Enum.any?(fn n -> rem(x, n) == 0 end)
    end
  end

  def left_to_right(x) do
    res = x
    |> Integer.to_string
    |> String.split("")
    |> Enum.slice(2..-2)
    |> List.to_string

    case res do
      "" -> :true
      _  -> (if has_factors(String.to_integer(res)) do
              :false
            else
              left_to_right(String.to_integer(res))
            end)
    end
  end

  def right_to_left(x) do
    res = x
    |> Integer.to_string
    |> String.split("")
    |> Enum.slice(1..-3)
    |> List.to_string

    case res do
      "" -> :true
      _  -> (if has_factors(String.to_integer(res)) do
              :false
            else
              right_to_left(String.to_integer(res))
            end)
    end
  end

end

Truncatable.primes
|> IO.puts

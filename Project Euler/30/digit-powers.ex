defmodule DigitPower do

   def fifth(n), do: _fifth(n, [])

   def _fifth(2, result), do: Enum.sum(result)

   def _fifth(n, result) do
     if Enum.sum(digit_powers(n)) == n do
       _fifth(n - 1, result ++ [n])
     else
       _fifth(n - 1, result)
     end
   end

   def digit_powers(num) do
     num
     |> Integer.to_string
     |> String.split("")
     |> List.delete_at(0)
     |> List.delete_at(-1)
     |> Enum.map(fn x -> Kernel.trunc(:math.pow(String.to_integer(x), 5)) end)
   end
end

DigitPower.fifth(236196)
|> IO.puts

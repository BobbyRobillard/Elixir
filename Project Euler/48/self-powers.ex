defmodule SelfPowers do
  def find do
    1..1000
    |> Enum.map(fn x -> pow(x, x) end)
    |> Enum.sum
  end

  def  pow(n, k), do: pow(n, k, 1)
  defp pow(_, 0, acc), do: acc
  defp pow(n, k, acc), do: pow(n, k - 1, n * acc)

end

SelfPowers.find
|> IO.puts

# 9110846700

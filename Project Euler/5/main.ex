defmodule SmallestMultiple do
  def find(), do: _find(10000)

  def _find(curr) do
      is_valid = (2..20
                 |> Enum.all?(fn x -> (rem(curr, x) == 0) end))
      if is_valid do
        found(curr)
      else
        _find(curr + 20)
      end
  end

  def found(result) do
    IO.puts(result)
    exit(:shutdown)
  end

  def even_divisors(num) do
    2..20
    |> Enum.all?(fn x -> (rem(num, x) == 0) end)
  end
end

# Main execution of the program
SmallestMultiple.find

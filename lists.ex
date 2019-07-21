defmodule MyList do

  # ------------------------------------------------------------------
  # Applies a function to a list and sums the result of those values
  # ------------------------------------------------------------------
  def mapsum(list, func), do: _mapsum(list, func, 0)

  defp _mapsum([], _, value) do
    value
  end

  defp _mapsum([head|tail], func, value) do
    _mapsum(tail, func, value + func.(head))
  end

  # ------------------------------------------------------------------
  # Returns the maximum element in a list
  # ------------------------------------------------------------------
  def max(list), do: _max(list, 0)

  defp _max([], max_value) do
    max_value
  end

  defp _max([head|tail], max_value) do
    if head >= max_value do
      _max(tail, head)
    else
      _max(tail, max_value)
    end
  end

  # ------------------------------------------------------------------
  # Ceaser cypher shifter
  # ------------------------------------------------------------------
  def caeser(text, shift) do
    text
    |> String.to_charlist()
    |> Enum.map( fn char -> char < 97 || 97 + rem( char - 71 + shift, 26 ) end )
    |> to_string()
  end

end

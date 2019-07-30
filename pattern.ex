defmodule Pattern do

  def anagram(w1, w2) do
    if String.length(w1) != String.length(w2) do
      False
    else
      Enum.sort(String.to_charlist w1) == Enum.sort(String.to_charlist w2)
    end
  end

  def max_length_string(list), do: _max_length_string(list, -1)

  def _max_length_string([], max), do: max

  def _max_length_string([head|tail], max) do
    if String.length(head) > max do
      _max_length_string(tail, head)
    else
      _max_length_string(tail, max)
    end
  end


  def center(list) do
    max_length_string(list) |>
    _center(list)
  end

  def _center(_, []), do: []

  def _center(max_len, [head|tail]) do
    String.pad_leading(head, max_len) |>
    String.pad_trailing(max_len) |>
    IO.puts
    _center(max_len, tail)
  end

end
# Pattern.anagram("abc", "djg")
# Enum.sort [3,2,1] |> Enum.at(-1)

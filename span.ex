defmodule MyList do

  def span(from, to, list), do: _span(from, to, list, [], 0)

  defp _span(_, _, [], result, _), do: result

  defp _span(from, to, [head|tail], result, at) do

    if (at >= from and at <= to) do
      _span(from, to, tail, result ++ [head], at + 1)
    else
      _span(from, to, tail, result, at + 1)
    end

  end

end

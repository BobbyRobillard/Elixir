defmodule MyEnum do

  ##############################################################################
  # Make sure all the elements in a list are the same
  ##############################################################################
  def all(list, func), do: _all(list, func, False)

  def _all([], _, has_elements) do
    if has_elements do
      True
    else
      False
    end
  end

  def _all([head|tail], func, has_elements) do
    if func.(head) do  _all(tail, func, has_elements)
    else False
    end
  end
  ##############################################################################
  # Applies a function to each item in a list
  ##############################################################################
  def each([], func) do :ok end

  def each([head|tail], func) do
    func.(head)
    each(tail, func)
  end
  ##############################################################################
  # Applies a function to filter for items in a list
  ##############################################################################
  def filter(list, func), do: _filter(list, func, [])

  def _filter([], func, result), do: result

  def _filter([head|tail], func, result) do
    if func.(head) do
      _filter(tail, func, result ++ [head])
    else
      _filter(tail, func, result)
    end
  end
end

# MyEnum.all([1,1,1], &(&1 < 4))
# MyEnum.each(["some", "example"], fn x -> IO.puts(x) end)
# MyEnum.filter([1, 2, 3], fn x -> rem(x, 2) == 0 end)

defmodule MergeSort do
  def sort([]), do: []
  def sort([x]), do: [x]

  def sort(list) do
    midpoint = div(length(list), 2)
    {left, right} = Enum.split(list, midpoint)
    merge(sort(left), sort(right))
  end

  def merge(left, []), do: left
  def merge([], right), do: right

  def merge([l | left], [r | right]) when l <= r do
    [l | merge(left, [r | right])]
  end

  def merge([l | left], [r | right]) do
    [r | merge([l | left], right)]
  end
end

arr = MergeSort.sort([12, 3, 7, 9, 14, 6, 11, 2])
IO.inspect(arr)

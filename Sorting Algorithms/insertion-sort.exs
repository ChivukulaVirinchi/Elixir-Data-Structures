defmodule InsertionSort do
  def sort(list) when is_list(list), do: do_sort(list, [])

  def do_sort([], sorted), do: sorted
  def do_sort([head | tail], sorted), do: do_sort(tail, insert(head, sorted))

  def insert(item, []), do: [item]
  def insert(item, [head | tail]) when item <= head, do: [item, head | tail]
  def insert(item, [head | tail]), do: [head | insert(item, tail)]
end

arr = InsertionSort.sort([5])
IO.inspect(arr)

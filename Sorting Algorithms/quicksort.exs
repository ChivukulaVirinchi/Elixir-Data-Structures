defmodule Quicksort do
  def sort([]) do
    []
  end

  def sort(list) do
    pivot = hd(list)
    {left_list, right_list} = Enum.reduce(list, {[], []}, &function(&1, &2, pivot))
    sort(left_list) ++ [pivot] ++ sort(right_list)
  end

  def function(x, acc, pivot) when x == pivot do
    acc
  end

  def function(x, {left_list, right_list}, pivot) when x > pivot do
    {left_list, right_list ++ [x]}
  end

  def function(x, {left_list, right_list}, _) do
    {left_list ++ [x], right_list}
  end
end

result = Quicksort.sort([2, 8, 7, 1, 3, 5, 6, 4])
result |> dbg()

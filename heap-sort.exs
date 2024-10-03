defmodule HeapSort do
  def sort(list) do
    heap = build_max_heap(list)
    do_sort(heap, length(list))
  end

  def do_sort(heap, 0), do: heap

  def do_sort([max | rest], i) do
    heapified = heapify(rest, 0)
    [max | do_sort(heapified, i - 1)]
  end

  def build_max_heap(list) do
    list_length = length(list)

    Enum.reduce((div(list_length, 2) - 1)..0, list, fn i, acc ->
      heapify(acc, i)
    end)
  end

  def heapify(list, i) do
    left = 2 * i + 1
    right = 2 * i + 2
    list_length = length(list)

    largest =
      cond do
        left < list_length and Enum.at(list, left) > Enum.at(list, i) -> left
        true -> i
      end

    largest =
      cond do
        right < list_length and Enum.at(list, right) > Enum.at(list, largest) -> right
        true -> largest
      end

    if largest != i do
      list = swap(list, largest, i)
      heapify(list, largest)
    else
      list
    end
  end

  def swap(list, i, j) do
    list
    |> List.replace_at(i, Enum.at(list, j))
    |> List.replace_at(j, Enum.at(list, i))
  end
end

result = HeapSort.sort([4, 1, 3, 2, 16, 9, 10, 14, 8, 7]) |> Enum.reverse()
IO.inspect(result)

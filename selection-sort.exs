defmodule SelectionSort do
  def sort([]) do
    []
  end

  def sort([x]), do: [x]

  def sort(list) do
    min = select(list)
    new_list = List.delete(list, min)
    [min] ++ sort(new_list)
  end

  def select([]), do: []

  def select(list) do
    Enum.reduce(list, &min/2)
  end
end

result = SelectionSort.sort([4, 2, 7, 1, 3])

result |> dbg()

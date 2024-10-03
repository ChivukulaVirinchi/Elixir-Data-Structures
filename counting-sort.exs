defmodule CountingSort do
  def sort(list) do
    list
    |> form_map()
    |> form_list()
  end

  def form_map(list) do
    Enum.reduce(list, %{}, fn x, acc -> Map.update(acc, x, 1, fn x -> x + 1 end) end)
  end

  def form_list(map) when is_map(map) do
    Enum.reduce(map, [], fn {key, value}, acc -> acc ++ List.duplicate(key, value) end)
  end
end


result = CountingSort.sort([2, 8, 7, 1, 3, 5, 6, 4, 4])
result |> dbg()

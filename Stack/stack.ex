defmodule Stack do
  def push(stack, item), do: [item | stack]

  def peek([]), do: nil
  def peek([head | _]), do: head

  def pop([]), do: []
  def pop([_ | tail]), do: tail
end

defmodule Valid do
  Code.require_file("stack.ex")
  alias Stack
  @brackets %{"(" => ")", "{" => "}", "[" => "]"}
  @opening_brackets Map.keys(@brackets)

  def valid?(string) do
    brackets = @opening_brackets ++ Map.values(@brackets)

    string
    |> String.graphemes()
    |> Enum.filter(fn x -> x in brackets end)
    |> Enum.reduce_while([], fn x, acc -> process_char(x, acc) end)
    |> Enum.empty?()
  end

  def process_char(char, stack) when char in @opening_brackets do
    {:cont, Stack.push(stack, char)}
  end

  def process_char(_, []), do: {:halt, ["invalid"]}

  def process_char(char, stack) do
    cond do
      char == Map.fetch!(@brackets, Stack.peek(stack)) -> {:cont, Stack.pop(stack)}
      true -> {:halt, stack}
    end
  end
end

# true
Valid.valid?("()") |> dbg()
# true
Valid.valid?("(())") |> dbg()
# true
Valid.valid?("({[]})") |> dbg()

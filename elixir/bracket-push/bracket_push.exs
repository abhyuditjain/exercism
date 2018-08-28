defmodule BracketPush do
  @doc """
  Checks that all the brackets and braces in the string are matched correctly, and nested correctly
  """
  @spec check_brackets(String.t()) :: boolean
  def check_brackets(str) do
    str
    |> String.codepoints()
    |> Enum.filter(fn x ->
      x === "(" || x === "{" || x === "[" || x === ")" || x === "}" || x === "]"
    end)
    |> brackets_check([])
  end

  defp brackets_check([], []), do: true
  defp brackets_check([], _), do: false

  defp brackets_check([head | tail], temp) when head in ["(", "{", "["] do
    brackets_check(tail, [head | temp])
  end

  defp brackets_check([head | _], []) when head in [")", "}", "]"], do: false

  defp brackets_check([head | tail], [tempHead | tempTail]) when head in [")", "}", "]"] do
    cond do
      (head === ")" && tempHead === "(") || (head === "}" && tempHead === "{") ||
          (head === "]" && tempHead === "[") ->
        brackets_check(tail, tempTail)

      true ->
        false
    end
  end
end

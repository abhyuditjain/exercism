defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t) :: map
  def count(sentence) do
    sentence
    |> String.downcase()
    |> String.replace(~r/[!|&|@|\$|%|\^|&|,|:]+/, "")
    |> String.split([" ", "_"])
    |> Stream.filter(&(&1 !== ""))
    |> Enum.reduce(%{}, &(Map.update(&2, &1, 1, fn (x) -> x + 1 end)))

  end
end

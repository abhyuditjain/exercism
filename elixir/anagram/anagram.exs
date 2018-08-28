defmodule Anagram do
  @doc """
  Returns all candidates that are anagrams of, but not equal to, 'base'.
  """
  @spec match(String.t(), [String.t()]) :: [String.t()]
  def match(base, candidates) do
    base = String.downcase(base)
    sortedBase =
      base
      |> String.to_charlist()
      |> Enum.sort()

    Enum.filter(candidates, fn x ->
      x = x |> String.downcase()
      sorted = x |> String.to_charlist() |> Enum.sort()
      sorted === sortedBase && x !== base
    end)
  end
end

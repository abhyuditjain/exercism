defmodule Pangram do
  @doc """
  Determines if a word or sentence is a pangram.
  A pangram is a sentence using every letter of the alphabet at least once.

  Returns a boolean.

    ## Examples

      iex> Pangram.pangram?("the quick brown fox jumps over the lazy dog")
      true

  """

  @spec pangram?(String.t()) :: boolean
  def pangram?(sentence) do
    count =
      sentence
      |> String.upcase()
      |> String.to_charlist()
      |> Stream.filter(&(&1 >= 65 && &1 <= 90))
      |> Stream.uniq()
      |> Enum.count()

    count === 26
  end
end

defmodule PigLatin do
  @doc """
  Given a `phrase`, translate it a word at a time to Pig Latin.

  Words beginning with consonants should have the consonant moved to the end of
  the word, followed by "ay".

  Words beginning with vowels (aeiou) should have "ay" added to the end of the
  word.

  Some groups of letters are treated like consonants, including "ch", "qu",
  "squ", "th", "thr", and "sch".

  Some groups are treated like vowels, including "yt" and "xr".
  """

  @vowels [?a, ?e, ?i, ?o, ?u]

  @spec translate(phrase :: String.t()) :: String.t()
  def translate(phrase) do
    phrase
    |> String.split()
    |> Stream.map(&String.to_charlist/1)
    |> Stream.map(&split_vowels_and_consonants/1)
    |> Stream.map(&translate_tuple/1)
    |> Enum.join(" ")
  end

  defp translate_tuple({word, cons}) do
    to_string(word ++ cons ++ [?a, ?y])
  end

  defp split_vowels_and_consonants([?y, ?t | _tail] = word) do
    {word, []}
  end

  defp split_vowels_and_consonants([?x, ?r | _tail] = word) do
    {word,  []}
  end

  defp split_vowels_and_consonants([h | _tail] = word) when h in @vowels do
    {word, []}
  end
  
  defp split_vowels_and_consonants([?c, ?h | tail] = _word) do
    {tail, [?c, ?h]}
  end
  
  defp split_vowels_and_consonants([?q, ?u | tail] = _word) do
    {tail, [?q, ?u]}
  end
  
  defp split_vowels_and_consonants([?s, ?q, ?u | tail] = _word) do
    {tail, [?s, ?q, ?u]}
  end

  defp split_vowels_and_consonants([?t, ?h, ?r | tail] = _word) do
    {tail, [?t, ?h, ?r]}
  end
  
  defp split_vowels_and_consonants([?t, ?h | tail] = _word) do
    {tail, [?t, ?h]}
  end
  
  defp split_vowels_and_consonants([?s, ?c, ?h | tail] = _word) do
    {tail, [?s, ?c, ?h]}
  end

  defp split_vowels_and_consonants([h | _tail] = word) when h not in @vowels do
    split_other(word, [])
  end

  defp split_other([h | tail] = word, cons) do
    case h in @vowels do
      true -> {word, cons}
      _ -> split_other(tail, cons ++ [h])
    end
  end

  defp split_other([], cons) do
    {[], cons}
  end  
end


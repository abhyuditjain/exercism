defmodule Bob do
  def hey(input) do
    cond do
      silence?(input) -> "Fine. Be that way!"
      questioning?(input) -> "Sure."
      shouting?(input) -> "Whoa, chill out!"
      true -> "Whatever."
    end
  end

  defp shouting?(input) do
    String.downcase(input) !== input && String.upcase(input) === input
  end

  defp questioning?(input) do
    String.ends_with?(input, "?")
  end

  defp silence?(input) do
    String.trim(input) === ""
  end
end

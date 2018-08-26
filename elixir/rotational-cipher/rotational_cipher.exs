defmodule RotationalCipher do
  @doc """
  Given a plaintext and amount to shift by, return a rotated string.

  Example:
  iex> RotationalCipher.rotate("Attack at dawn", 13)
  "Nggnpx ng qnja"
  """

  defp shift_char(char, shift) when char in ?a..?z do
    shift_with_base(char, shift, ?a)
  end

  defp shift_char(char, shift) when char in ?A..?Z do
    shift_with_base(char, shift, ?A)
  end

  defp shift_char(char, _), do: char

  defp shift_with_base(char, shift, base) do
    base + rem(char + shift - base, 26)
  end  
  @spec rotate(text :: String.t(), shift :: integer) :: String.t()
  def rotate(text, shift) do
    text
    |> String.to_charlist()
    |> Enum.map(&(shift_char(&1, shift)))
    |> to_string()
  end
end


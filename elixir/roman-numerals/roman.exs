defmodule Roman do
  @doc """
  Convert the number to a roman number.
  """
  @mapping [
    {1000, "M"},
    {900, "CM"},
    {500, "D"},
    {400, "CD"},
    {100, "C"},
    {90, "XC"},
    {50, "L"},
    {40, "XL"},
    {10, "X"},
    {9, "IX"},
    {5, "V"},
    {4, "IV"},
    {1, "I"}
  ]
  @spec numerals(pos_integer) :: String.t()
  def numerals(number) do
    case numeral(number) do
      {denotion, 0} -> denotion
      {denotion, num} -> denotion <> numerals(num)
    end
  end

  for {number, denotion} <- @mapping do
    def numeral(n) when n >= unquote(number), do: {unquote(denotion), n - unquote(number)}
  end
end

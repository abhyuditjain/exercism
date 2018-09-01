defmodule BeerSong do
  @doc """
  Get a single verse of the beer song
  """
  @spec verse(integer) :: String.t()
  def verse(number) do
    part(number)
  end

  @doc """
  Get the entire beer song for a given range of numbers of bottles.
  """
  @spec lyrics(Range.t()) :: String.t()
  def lyrics(range) do
    Enum.map(range, &part/1) |> Enum.join("\n")
  end

  def lyrics() do
    lyrics(99..0)
  end

  for num <- 99..0 do
    defp part(unquote(num)) do
      case unquote(num) do
        0 ->
          """
          No more bottles of beer on the wall, no more bottles of beer.
          Go to the store and buy some more, 99 bottles of beer on the wall.
          """

        1 ->
          """
          1 bottle of beer on the wall, 1 bottle of beer.
          Take it down and pass it around, no more bottles of beer on the wall.
          """

        2 ->
          """
          2 bottles of beer on the wall, 2 bottles of beer.
          Take one down and pass it around, 1 bottle of beer on the wall.
          """

        _ ->
          """
          #{unquote(num)} bottles of beer on the wall, #{unquote(num)} bottles of beer.
          Take one down and pass it around, #{unquote(num) - 1} bottles of beer on the wall.
          """
      end
    end
  end
end

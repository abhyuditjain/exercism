defmodule Strain do
  @doc """
  Given a `list` of items and a function `fun`, return the list of items where
  `fun` returns true.

  Do not use `Enum.filter`.
  """
  @spec keep(list :: list(any), fun :: ((any) -> boolean)) :: list(any)
  def keep(list, fun) do
    keep_or_discard(list, fun, [], :keep) 
  end

  defp keep_or_discard([h | t], fun, arr, :keep) do
    case fun.(h) do
      true -> keep_or_discard(t, fun, [h | arr], :keep)
      _ -> keep_or_discard(t, fun, arr, :keep)
    end
  end

  defp keep_or_discard([h | t], fun, arr, :discard) do
    case fun.(h) do
      true -> keep_or_discard(t, fun, arr, :discard)
      _ -> keep_or_discard(t, fun, [h | arr], :discard)
    end 
  end

  defp keep_or_discard([], _, arr, _) do
    Enum.reverse(arr)
  end

  @doc """
  Given a `list` of items and a function `fun`, return the list of items where
  `fun` returns false.

  Do not use `Enum.reject`.
  """
  @spec discard(list :: list(any), fun :: ((any) -> boolean)) :: list(any)
  def discard(list, fun) do
    keep_or_discard(list, fun, [], :discard)
  end
end

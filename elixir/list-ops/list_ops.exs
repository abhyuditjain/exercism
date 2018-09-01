defmodule ListOps do
  # Please don't use any external modules (especially List) in your
  # implementation. The point of this exercise is to create these basic functions
  # yourself.
  #
  # Note that `++` is a function from an external module (Kernel, which is
  # automatically imported) and so shouldn't be used either.

  @spec count(list) :: non_neg_integer
  def count(l) do
    count(l, 0)
  end

  defp count([], count), do: count
  defp count([_ | t], count), do: count(t, count + 1)

  @spec reverse(list) :: list
  def reverse(l) do
    reverse(l, [])
  end

  defp reverse([], new_list), do: new_list
  defp reverse([h | t], new_list), do: reverse(t, [h | new_list])

  @spec map(list, (any -> any)) :: list
  def map(l, f) do
    map(l, f, [])
  end

  defp map([], _, mapped), do: reverse(mapped)
  defp map([h | t], f, mapped), do: map(t, f, [f.(h) | mapped])

  @spec filter(list, (any -> as_boolean(term))) :: list
  def filter(l, f) do
    filter(l, f, [])
  end

  defp filter([], _, filtered), do: reverse(filtered)

  defp filter([h | t], f, filtered) do
    case f.(h) do
      true -> filter(t, f, [h | filtered])
      _ -> filter(t, f, filtered)
    end
  end

  @type acc :: any
  @spec reduce(list, acc, (any, acc -> acc)) :: acc
  def reduce(l, acc, f) do
    reducep(l, acc, f)
  end

  defp reducep([], acc, _), do: acc
  defp reducep([h | t], acc, f), do: reducep(t, f.(h, acc), f)

  @spec append(list, list) :: list
  def append(a, b) do
    append(a, b, [])
  end

  defp append([], [], appended), do: reverse(appended)
  defp append([], [h | t], appended), do: append([], t, [h | appended])
  defp append([h | t], b, appended), do: append(t, b, [h | appended])

  @spec concat([[any]]) :: [any]
  def concat(ll) do
    concat(ll, [])
  end

  defp concat([], concatenated), do: reverse(concatenated)
  defp concat([[] | t], concatenated), do: concat(t, concatenated)
  defp concat([ [h | t_inner ]| t], concatenated), do: concat([t_inner| t], [h | concatenated])

end

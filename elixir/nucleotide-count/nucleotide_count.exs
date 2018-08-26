defmodule NucleotideCount do
  @nucleotides [?A, ?C, ?G, ?T]

  @doc """
  Counts individual nucleotides in a NucleotideCount strand.

  ## Examples

  iex> NucleotideCount.count('AATAA', ?A)
  4

  iex> NucleotideCount.count('AATAA', ?T)
  1
  """
  @spec count([char], char) :: non_neg_integer
  def count(strand, nucleotide) do
    count(strand, nucleotide, 0)
  end
  
  defp count([h | t], char, count) do
    case h do
      ^char -> count(t, char, count + 1)
      _ -> count(t, char, count)
    end
  end

  defp count([], _, count) do
    count
  end

  @doc """
  Returns a summary of counts by nucleotide.

  ## Examples

  iex> NucleotideCount.histogram('AATAA')
  %{?A => 4, ?T => 1, ?C => 0, ?G => 0}
  """
  @spec histogram([char]) :: map
  def histogram(strand) do
    histogram(strand, %{?A => 0, ?T => 0, ?G => 0, ?C => 0})
  end

  defp histogram([h | t], map) do
    histogram(t, Map.update(map, h, 1, &(&1 + 1)))
  end

  defp histogram([], map) do
    map
  end
end

defmodule SumOfMultiples do
  @doc """
  Adds up all numbers from 1 to a given end number that are multiples of the factors provided.
  """
  @spec to(non_neg_integer, [non_neg_integer]) :: non_neg_integer
  def to(limit, factors) do
    Enum.reduce(1..limit-1, 0, fn x, acc ->
      case Enum.any?(factors, &(rem(x, &1) === 0)) do
        false -> acc
        _ -> acc + x
      end
    end)
  end
end

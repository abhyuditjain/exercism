defmodule ProteinTranslation do
  @doc """
  Given an RNA string, return a list of proteins specified by codons, in order.
  """
  @spec of_rna(String.t()) :: { atom,  list(String.t()) }
  def of_rna(rna) do
    len = String.length(rna)
    case rem(len, 3) do
      0 -> get_result(String.to_charlist(rna), [])
      _ -> {:error, "invalid RNA"}
    end
  end

  defp get_result([a, b, c | tail], words) do
    codon = [a, b, c] |> to_string()
    case of_codon(codon) do
      {:error, _} -> {:error, "invalid RNA"}
      {:ok, "STOP"} -> get_result([], words)
      {:ok, prot} -> get_result(tail, words ++ [prot])
    end
  end

  defp get_result([], words) do
    {:ok, words}
  end

  @doc """
  Given a codon, return the corresponding protein

  UGU -> Cysteine
  UGC -> Cysteine
  UUA -> Leucine
  UUG -> Leucine
  AUG -> Methionine
  UUU -> Phenylalanine
  UUC -> Phenylalanine
  UCU -> Serine
  UCC -> Serine
  UCA -> Serine
  UCG -> Serine
  UGG -> Tryptophan
  UAU -> Tyrosine
  UAC -> Tyrosine
  UAA -> STOP
  UAG -> STOP
  UGA -> STOP
  """

  @codons %{
    "UGU" => "Cysteine", 
    "UGC" => "Cysteine", 
    "UUA" => "Leucine", 
    "UUG" => "Leucine", 
    "AUG" => "Methionine",
    "UUU" => "Phenylalanine",
    "UUC" => "Phenylalanine",
    "UCU" => "Serine",
    "UCC" => "Serine",
    "UCA" => "Serine",
    "UCG" => "Serine",
    "UGG" => "Tryptophan",
    "UAU" => "Tyrosine",
    "UAC" => "Tyrosine",
    "UAA" => "STOP",
    "UAG" => "STOP",
    "UGA" => "STOP"
  }

  @spec of_codon(String.t()) :: { atom, String.t() }
  def of_codon(codon) do
    case Map.get(@codons, codon, :nil) do
      :nil -> {:error, "invalid codon"}
      codon -> {:ok, codon}
    end
  end
end


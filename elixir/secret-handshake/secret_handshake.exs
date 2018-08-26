defmodule SecretHandshake do
  @doc """
  Determine the actions of a secret handshake based on the binary
  representation of the given `code`.

  If the following bits are set, include the corresponding action in your list
  of commands, in order from lowest to highest.

  1 = wink
  10 = double blink
  100 = close your eyes
  1000 = jump

  10000 = Reverse the order of the operations in the secret handshake
  """

  @checker 0b11111

  use Bitwise, only_operators: true

  defp _wink(0), do: []
  defp _wink(1), do: ["wink"]
  defp _double_blink(0), do: []
  defp _double_blink(1), do: ["double blink"]
  defp _close_your_eyes(0), do: []
  defp _close_your_eyes(1), do: ["close your eyes"]
  defp _jump(0), do: []
  defp _jump(1), do: ["jump"]

  defp _get_handshake([z]), do: _wink(z)
  defp _get_handshake([y, z]), do: _wink(z) ++ _double_blink(y)
  defp _get_handshake([x, y, z]), do: _wink(z) ++ _double_blink(y) ++ _close_your_eyes(x)
  defp _get_handshake([w, x, y, z]), do: _wink(z) ++ _double_blink(y) ++ _close_your_eyes(x) ++ _jump(w)
  defp _get_handshake([1, w, x, y, z]), do: _jump(w) ++ _close_your_eyes(x) ++ _double_blink(y) ++ _wink(z)
  
  @spec commands(code :: integer) :: list(String.t())
  def commands(code) do
    (code &&& @checker)
    |> Integer.digits(2)
    |> _get_handshake()
  end
end


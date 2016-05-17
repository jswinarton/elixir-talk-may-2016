defmodule Math do
  @moduledoc """
  A simple module demonstrating function arity.

  Elixir modules allow for multiple function definitions
  with the same name, provided that the arguments to each
  match a different pattern.
  """

  def sum(a, b), do: a + b

  def sum(a, b, c), do: sum(a, b) + c
end


IO.puts Math.sum(1, 2)
IO.puts Math.sum(1, 2, 3)

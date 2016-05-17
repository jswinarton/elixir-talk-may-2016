defmodule Math do
  @moduledoc """
  A simple module demonstrating function arity.
  """

  def sum(a, b), do: a + b
end

IO.puts Math.sum(1, 2)
IO.puts Math.sum(1, 2, 3)  # error

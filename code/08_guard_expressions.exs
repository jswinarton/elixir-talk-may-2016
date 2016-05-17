defmodule Math do
  @moduledoc """
  Guard expressions provide a way to define functions that
  accept a limited set of values. This is often much
  more concise and less error-prone than handling type
  checking within a method in other languages.
  """

  def zero?(0) do
    true
  end

  def zero?(x) when is_number(x) do
    false
  end

end

IO.puts Math.zero?(0)
IO.puts Math.zero?(1)
IO.puts Math.zero?([1,2,3])  # error, no matching function clause

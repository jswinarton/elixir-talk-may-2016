defmodule Receiver do

  @doc """
  In this example, we'll use `spawn_link` instead of
  just `spawn`. The only difference is that if an error
  is raised in a linked process, it will crash the parent
  process as well as the child process.

  Also note that Elixir has a simplified syntax for
  single-line function defs.
  """
  def start, do: spawn_link &loop/0

  defp loop do
    receive do
      :ping ->
        IO.puts "ping received!"
      :pong ->
        IO.puts "pong received!"

      # Catch any messages we don't understand and
      # throw an error
      message ->
        raise "you made a bad! #{inspect message} is bad."
    end
    loop
  end
end


receiver = Receiver.start

:timer.sleep 1000
send receiver, :ping
:timer.sleep 1000
send receiver, :pong
:timer.sleep 1000
send receiver, :potato

# With spawn_link, these lines will never be reached.
:timer.sleep 1000
IO.puts "end"

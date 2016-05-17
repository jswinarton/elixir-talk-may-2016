defmodule MessageQueue do
  @moduledoc """
  A simple demonstration of how
  messages are stored in a non-blocking queue.
  """

  def start do
    spawn_link &loop/0
  end

  defp loop do
    receive do
      :ping ->
        :timer.sleep(1000)
        IO.puts "acting on ping"
        loop
    end
  end
end


receiver = MessageQueue.start

send receiver, :ping
send receiver, :ping
send receiver, :ping
send receiver, :ping
send receiver, :ping

# Use an erlang module (!) to inspect the process mailbox and
# print the message queue.
:erlang.process_info(receiver, :messages) |> IO.inspect

receive do
end

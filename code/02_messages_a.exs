# Send a message from the parent process (the current
# execution context) to a spawned child process.

receiver = spawn fn ->
  # Any process that reaches a receive block
  # will wait indefinitely until a message is received.
  # When the message is received, the process will
  # execute any behaviour defined in the receive block
  # and then continue normally.
  receive do
    :ping ->
      IO.puts "ping received!"
  end

  # If there was code here, it would be executed after the
  # first message was processed.
end


:timer.sleep 1000
send receiver, :ping

# Sending a message twice has no effect,
# since the process has already exited.
# :timer.sleep 1000
# send receiver, :ping
# IO.puts Process.alive?(receiver)  # process ded now, ok :(

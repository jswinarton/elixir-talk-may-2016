# Spawn a shit ton of processes. Why not?
# Each process sleeps prints a single integer. Even though
# the processes are initiated in order, it's up to the
# Erlang VM to decide what order to execute them
# in. The values will print in nondeterministic order.
for num <- 1..10000 do
  spawn fn ->
    IO.puts num
  end
end

# Uncomment the receive block to ensure the main process
# doesn't exit before the spawned processes finish running.
# Alternatively, you can run this script using `elixir --no-halt`.
# receive do
# end

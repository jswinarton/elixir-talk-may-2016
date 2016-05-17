defmodule Receiver do
  @moduledoc """
  In order to achieve code reusability, Elixir provides us
  with modules. Modules are nothing more than a collection of
  functions, defined with `def` or `defp`. That's it.

  Unlike Ruby, functions MUST be defined in a module in
  order to be executed at runtime.

  Elixir also gives us first-class documentation tooling
  through `@moduledoc` and `@doc`, which can be transformed
  into HTML via the `exdoc` tool.

  _All documentation is written inside multiline strings
  that support Markdown! Woo!_
  """

  @doc """
  Calling Receiver.start will return a process
  that reponds to :ping messages indefinitely.

  Note that `&` notation can be used to retrive a named function.
  This is equivalent to `spawn fn -> loop end`.
  """
  def start do
    spawn &loop/0
  end

  defp loop do
    # when a process running this method receives a :ping
    # message, it will output a message, then recursively call
    # itself, in order to wait for another message.
    receive do
      :ping ->
        IO.puts "ping received!"
    end
    loop
  end
end


receiver = Receiver.start

for _ <- 1..10 do
  :timer.sleep 1000
  send receiver, :ping
end

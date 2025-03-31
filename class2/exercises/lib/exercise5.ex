defmodule Exercises.Exercise5 do
  @doc """
   Spawn a new process, register it under :hello name, and pattern match on two messages - :hello and :world
     - waits for :world msg first, send it to :test process,
     - and after that waits for :hello msg and send it to :test process too

   input: none
   returns: pid

  to test run in console:
    mix test --only test5
  """
  def selective_receive() do
    # write your code here
  end
end

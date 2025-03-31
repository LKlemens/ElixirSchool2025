defmodule Exercises.Exercise3 do
  @doc """
   Spawn a new process, register it under :hello name, wait for :ping message and print it out.
   input: none
   returns: pid

  to test run in console:
    mix test --only test3.1
  """
  def wait_and_print() do
    # write your code here
  end

  @doc """
   Spawn a new process, register it under :hello name, wait for :ping message and print it out.
   Spawn another process and after 300ms send :shutdown signal to :hello process to terminate it.
   input: none
   returns: none

  to test run:
    mix test --only test3.2
  """
  def terminate_process() do
    # write your code here
  end
end

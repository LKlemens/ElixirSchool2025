defmodule Exercises.Exercise9 do
  @doc """
   Spawn :server process, which endlessly handles messages.
   Sever should pass messages to :test process.
   When server gets exit singal, then it should send :handle_exit message to :test process.
   Server should send :nothing_todo message to :test process after 500ms inactivity.
   Spawn unregistered client process which sends to server 10 messages


  to test run in console:
    mix test --only test9
  """
  def server() do
    # write your code here
  end

  def client() do
    # write your code here
  end
end

defmodule Exercises.Exercise6 do
  @doc """
   - Spawn a new process, 
     - register it under :world name, 
     - start monitoring :hello process by :world process, 
     - after 1 second send :bad_msg to :hello process
     - wait for down msg from :hello process and send it to :test process
     - wait for next message
   - spawn a new unregistered process, 
      - wait 1500ms 
      - print ":world is alive!" if process :world is alive
      - print ":world is dead!" otherwise
   - explain why :world process is alive or dead
   input: none
   returns: pid


  to test run in console:
    mix test --only test6
  """
  def process_monitor() do
    _hello =
      spawn(fn ->
        Process.register(self(), :hello)

        receive do
          :bad_msg -> raise("error")
          :die_normally -> :ok
        end
      end)

    # write here your code
  end
end

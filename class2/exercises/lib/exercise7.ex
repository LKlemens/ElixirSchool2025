defmodule Exercises.Exercise7 do
  @doc """
   - Spawn a new process, 
     - register it under :world name, 
     - link to :hello process
     - after 1 second send :bad_msg to :hello process
     - wait for next message
   - spawn a new unregistered process, 
      - wait 1500ms 
      - check if process :world is alive and:
        - send to :test process ":world is alive!" if process :world is alive
        - send to :test process ":world is dead!" otherwise
    - explain why :world process is alive or dead
   input: none
   returns: pid


  to test run in console:
   mix test --only test7
  """
  def process_link() do
    pid_hello =
      spawn(fn ->
        receive do
          :bad_msg -> raise("error")
          :die_normally -> :ok
        end
      end)

    Process.register(pid_hello, :hello)

    # write here your code
  end
end

defmodule Exercises.Exercise8 do
  @doc """
   - Modify exercise7 by adding trap_exit to world process.
   - handle exit signal
    - send exit message to :test process
   - explain why :world process is alive or dead

   input: none
   returns: pid


  to test run in console:
     mix test --only test8
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

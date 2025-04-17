defmodule Exercises.Exercise3Test do
  use ExUnit.Case, async: false

  @tag :"test3.1"
  test "Should return pid, register it under :hello name, handle msg and terminate" do
    pid = Exercises.Exercise3.wait_and_print()
    assert is_pid(pid) == true, "Function should return pid"
    Process.sleep(300)
    assert Process.alive?(pid) == true, "Process should wait for a :ping message"
    send(pid, :ping)
    Process.sleep(300)
    assert Process.alive?(pid) == false, "Process should terminate after receiving msg"
  end

  @tag :"test3.2"
  test "Should return pid, register it under :hello name, handle msg and terminated by :shutdown signal" do
    Exercises.Exercise3.terminate_process()
    Process.sleep(100)
    pid = Process.whereis(:hello)
    assert is_pid(pid) == true, "Function should return pid"
    Process.sleep(100)
    assert Process.alive?(pid) == true, "Process should wait for a :ping message"
    Process.sleep(200)
    assert Process.alive?(pid) == false, "Process should terminate after getting :shutdown signal"
  end
end

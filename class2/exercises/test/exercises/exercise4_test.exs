defmodule Exercises.Exercise4Test do
  use ExUnit.Case, async: false

  @tag :test4
  test "Should send :timeout messgae after 500ms" do
    Process.register(self(), :test)
    pid = Exercises.Exercise4.send_timeout()
    assert is_pid(pid) == true, "Function should return pid"

    refute_receive :timeout,
                   490,
                   ":test process should get :timeout message after 500ms - not earlier"

    assert Process.alive?(pid) == true, "Process should wait for a :ping message"

    assert_receive :timeout,
                   50,
                   "Process :hello should send :timeout msg to :test process after 500ms"
  end
end

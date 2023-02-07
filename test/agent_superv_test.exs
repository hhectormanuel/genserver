defmodule AgentSupervTest do
  use ExUnit.Case
  doctest AgentSuperv

  test "greets the world" do
    assert AgentSuperv.hello() == :world
  end
end

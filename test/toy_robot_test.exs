defmodule ToyRobotTest do
  use ExUnit.Case
  doctest ToyRobot

  test "moves west when dir == 'WEST'" do
    assert ToyRobot.move(%{north: 0, east: 3, dir: "WEST"}) == %{north: 0, east: 2, dir: "WEST"}
  end
  test "moves south when dir == 'SOUTH'" do
    assert ToyRobot.move(%{north: 3, east: 0, dir: "SOUTH"}) == %{north: 2, east: 0, dir: "SOUTH"}
  end

end

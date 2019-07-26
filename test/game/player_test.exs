defmodule ToyRobot.Game.PlayerTest do
  use ExUnit.Case, async: true

  alias ToyRobot.Game.Player
  alias ToyRobot.Robot

  describe "report" do
    setup do
      starting_position = %Robot{x: 0, y: 0, facing: :north}
      {:ok, player} = Player.start(starting_position)
      %{player: player}
    end

    test "shows the current position of the robot", %{player: player} do
      assert Player.report(player) == %Robot{x: 0, y: 0, facing: :north}
    end
  end

  describe "move" do
    setup do
      starting_position = %Robot{x: 0, y: 0, facing: :north}
      {:ok, player} = Player.start(starting_position)
      %{player: player}
    end

    test "moves the robot forward one space", %{player: player} do
      %{robot: robot} = Player.move(player)

      assert robot == %Robot{
               x: 0,
               y: 1,
               facing: :north
             }
    end
  end

  describe "turn_left" do
    setup do
      starting_position = %Robot{x: 0, y: 0, facing: :north}
      {:ok, player} = Player.start(starting_position)
      %{player: player}
    end

    test "turns the robot left", %{player: player} do
      %{robot: robot} = Player.turn_left(player)

      assert robot == %Robot{
               x: 0,
               y: 0,
               facing: :west
             }
    end
  end

  describe "turn_right" do
    setup do
      starting_position = %Robot{x: 0, y: 0, facing: :north}
      {:ok, player} = Player.start(starting_position)
      %{player: player}
    end

    test "turns the robot right", %{player: player} do
      %{robot: robot} = Player.turn_right(player)

      assert robot == %Robot{
               x: 0,
               y: 0,
               facing: :east
             }
    end
  end
end

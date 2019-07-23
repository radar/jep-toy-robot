defmodule ToyRobot.Game.Player do
  alias ToyRobot.Robot
  defstruct [x: 0, y: 0, facing: :north]

  use GenServer

  def start_link(args) do
    GenServer.start_link(__MODULE__, args, name: __MODULE__)
  end

  def start(robot) do
    GenServer.start(__MODULE__, robot)
  end

  def init(%{x: x, y: y, facing: facing}) do
    {:ok, %Robot{x: x, y: y, facing: facing}}
  end

  def report(robot) do
    GenServer.call(robot, :report)
  end

  def move(robot) do
    GenServer.call(robot, :move)
  end

  def handle_call(:report, _from, robot) do
    {:reply, robot, robot}
  end

  def handle_call(:move, _from, robot) do
    new_robot = robot |> Robot.move
    {:reply, new_robot, new_robot}
  end

  def handle_call(:turn_left, _from, robot) do
    new_robot = robot |> Robot.turn_left
    {:reply, new_robot, new_robot}
  end

  def handle_call(:turn_right, _from, robot) do
    new_robot = robot |> Robot.turn_right
    {:reply, new_robot, new_robot}
  end
end
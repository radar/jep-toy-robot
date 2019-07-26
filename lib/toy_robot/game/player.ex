defmodule ToyRobot.Game.Player do
  alias ToyRobot.{Table, Simulation}

  defstruct x: 0, y: 0, facing: :north

  use GenServer

  def start_link(args) do
    GenServer.start_link(__MODULE__, args, name: __MODULE__)
  end

  def start(robot) do
    GenServer.start(__MODULE__, robot)
  end

  def init(robot) do
    simulation = %Simulation{
      table: %Table{
        x_boundary: 4,
        y_boundary: 4
      },
      robot: robot
    }

    {:ok, simulation}
  end

  def report(simulation) do
    GenServer.call(simulation, :report)
  end

  def move(simulation) do
    GenServer.call(simulation, :move)
  end

  def turn_left(simulation) do
    GenServer.call(simulation, :turn_left)
  end

  def turn_right(simulation) do
    GenServer.call(simulation, :turn_right)
  end

  def handle_call(:report, _from, simulation) do
    {:reply, simulation |> Simulation.report(), simulation}
  end

  def handle_call(:move, _from, simulation) do
    {:ok, new_simulation} = simulation |> Simulation.move()
    {:reply, new_simulation, new_simulation}
  end

  def handle_call(:turn_left, _from, simulation) do
    # new_robot = robot |> Robot.turn_left()
    # {:reply, new_robot, new_robot}
    {:ok, new_simulation} = simulation |> Simulation.turn_left()
    {:reply, new_simulation, new_simulation}
  end

  def handle_call(:turn_right, _from, simulation) do
    {:ok, new_simulation} = simulation |> Simulation.turn_right()
    {:reply, new_simulation, new_simulation}
  end
end

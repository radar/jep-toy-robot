defmodule ToyRobot.Robot do
  alias ToyRobot.Robot
  defstruct x: 0, y: 0, facing: :north

  @doc """
  Moves the robot forward one space in the direction it is facing

  ## Examples

    iex> alias ToyRobot.Robot
    ToyRobot.Robot
    iex> robot = %Robot{y: 0, facing: :north}
    %Robot{y: 0, facing: :north}
    iex> robot |> Robot.move
    %Robot{y: 1}
  """
  def move(%__MODULE__{facing: facing} = robot) do
    case facing do
      :north -> robot |> move_north
      :east -> robot |> move_east
      :south -> robot |> move_south
      :west -> robot |> move_west
      :default -> IO.puts("PAM POWWWW")
    end
  end

  # @spec turn_left(ToyRobot.Robot.t()) :: ToyRobot.Robot.t()
  def turn_left(%__MODULE__{facing: facing} = robot) do
    new_facing =
      case facing do
        :north -> :west
        :east -> :north
        :south -> :east
        :west -> :south
        :default -> IO.puts("NO CAN DO - LEFT")
      end

    %Robot{robot | facing: new_facing}
  end

  def turn_right(%__MODULE__{facing: facing} = robot) do
    new_facing =
      case facing do
        :north -> :east
        :east -> :south
        :south -> :west
        :west -> :north
        :default -> IO.puts("NO CAN DO - RIGHT")
      end

    %Robot{robot | facing: new_facing}
  end

  defp move_east(%Robot{} = robot) do
    %Robot{robot | x: robot.x + 1}
  end

  defp move_west(%Robot{} = robot) do
    %Robot{robot | x: robot.x - 1}
  end

  defp move_north(%Robot{} = robot) do
    %Robot{robot | y: robot.y + 1}
  end

  defp move_south(%Robot{} = robot) do
    %Robot{robot | y: robot.y - 1}
  end
end

defmodule ToyRobot.Simulation do
  alias ToyRobot.{Robot, Table}
  defstruct [:table, :robot]

  @doc """
  Simulates placing a robot on a table.

  ## Examples

      When the robot is placed in a valid position:

      iex> alias ToyRobot.{Robot, Table, Simulation}
      [ToyRobot.Robot,ToyRobot.Table, ToyRobot.Simulation]
      iex> table = %Table{y_boundary: 4, x_boundary: 4}
      %Table{y_boundary: 4, x_boundary: 4}
      iex> Simulation.place(table, %{y: 0, x: 0, facing: :north})
      {
        :ok,
        %Simulation{
          table: table,
          robot: %Robot{y: 0, x: 0, facing: :north}
        }
      }

      When the robot is placed in an invalid position:

      iex> alias ToyRobot.{Robot, Table, Simulation}
      [ToyRobot.Robot,ToyRobot.Table, ToyRobot.Simulation]
      iex> table = %Table{y_boundary: 4, x_boundary: 4}
      %Table{y_boundary: 4, x_boundary: 4}
      iex> Simulation.place(table, %{y: 6, x: 0, facing: :north})
      {:error, :invalid_placement}
  """
  def place(table, placement) do
    if table |> Table.valid_position?(placement) do
      {
        :ok,
        %{
          table: table,
          robot: struct(Robot, placement)
        }
      }
    else
      {:error, :invalid_placement}
    end

    # case Simulation.place(table, placement) do
    #   {:ok, simulation} -> #Do something with simulation here
    #   {:error, :invalid_placement} -> IO.puts "That placement was invalid."
    # end
    
    # {
    #   :ok,
    #   %__MODULE__{
    #     table: table,
    #     robot: struct(Robot, placement),
    #   }
    # }
  end
end
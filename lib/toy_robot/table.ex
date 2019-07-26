defmodule ToyRobot.Table do
  alias ToyRobot.Table
  defstruct [:x_boundary, :y_boundary]

  @doc """
  Determines if a position would be within the table's boundaries.

  ## Examples

      iex> alias ToyRobot.Table
      ToyRobot.Table
      iex> table = %Table{y_boundary: 4, x_boundary: 4}
      %Table{y_boundary: 4, x_boundary: 4}
      iex> table |> Table.valid_position?(%{y: 4, x: 4})
      true
      iex> table |> Table.valid_position?(%{y: 0, x: 0})
      true
      iex> table |> Table.valid_position?(%{y: 6, x: 0})
      false
      iex> table |> Table.valid_position?(%{y: 6, x: 6})
      false
  """
  def valid_position?(
        %Table{y_boundary: y_boundary, x_boundary: x_boundary},
        %{y: y, x: x}
      ) do
    y >= 0 && y <= y_boundary && x >= 0 && x <= x_boundary
  end
end

defmodule ToyRobot do
  @moduledoc """
  Documentation for ToyRobot.
  """

  @doc """
  Moves one space forward.

  ## Examples

      iex> ToyRobot.move(%{north: 0, east: 0, dir: "NORTH"})
      %{north: 1, east: 0, dir: "NORTH"}

      iex> %{north: 0, east: 0, dir: "NORTH"} |> ToyRobot.move |> ToyRobot.move
      %{north: 2, east: 0, dir: "NORTH"}
  """
  def move(%{north: north, east: east, dir: "NORTH"}) do
    %{north: north + 1, east: east, dir: "NORTH"}
  end
end

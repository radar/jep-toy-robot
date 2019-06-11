defmodule ToyRobot do
  @moduledoc """
  Documentation for ToyRobot.
  """

  @doc """
  Moves one space forward.

  ## Examples

      iex> ToyRobot.move(%{north: 0, east: 0, dir: "NORTH"})
      %{north: 1, east: 0, dir: "NORTH"}

      iex> %{north: 0, east: 0, dir: "EAST"} |> ToyRobot.move |> ToyRobot.move
      %{north: 0, east: 2, dir: "EAST"}
  """
  def move(%{north: north, east: east, dir: "NORTH" = dir}) do
    %{north: north + 1, east: east, dir: dir}
  end

  def move(%{north: north, east: east, dir: "EAST" = dir}) do
    %{north: north, east: east + 1, dir: dir}
  end

  def move(%{north: north, east: east, dir: "WEST" = dir}) do
    %{north: north, east: east - 1, dir: dir}
  end

  def move(%{north: north, east: east, dir: "SOUTH" = dir}) do
    %{north: north - 1, east: east, dir: dir}
  end
end

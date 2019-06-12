require IEx
#source config/.env

defmodule ToyRobot do

  @moduledoc """
  Documentation for ToyRobot.
  """

  def check_boundary(%{north: 4, east: _, dir: "NORTH"} = position) do
    {:error, "Facing boundary, cannot move", position}
  end

  def check_boundary(%{north: 0, east: _, dir: "SOUTH"} = position) do
    {:error, "Facing boundary, cannot move", position}
  end

  def check_boundary(%{north: _, east: 4, dir: "EAST"} = position) do
    {:error, "Facing boundary, cannot move", position}
  end

  def check_boundary(%{north: _, east: 0, dir: "WEST"} = position) do
    {:error, "Facing boundary, cannot move", position}
  end

  def check_boundary(%{north: _, east: _, dir: _} = position) do
    {:ok, position}
  end
  
  def move(%{north: _, east: _, dir: _} = position) do
    check_boundary(position)
    |> move()
  end

  @doc """
  Moves one space forward.

  ## Examples

      iex> ToyRobot.move(%{north: 0, east: 0, dir: "NORTH"})
      %{north: 1, east: 0, dir: "NORTH"}

      iex> %{north: 0, east: 0, dir: "EAST"} |> ToyRobot.move |> ToyRobot.move
      %{north: 0, east: 2, dir: "EAST"}
  """

  def move({:ok, %{north: north, east: east, dir: "NORTH" = dir}}) do
    %{north: north + 1, east: east, dir: dir}
  end

  def move({:ok, %{north: north, east: east, dir: "EAST" = dir}}) do
    %{north: north, east: east + 1, dir: dir}
  end

  def move({:ok, %{north: north, east: east, dir: "WEST" = dir}}) do
    %{north: north, east: east - 1, dir: dir}
  end

  def move({:ok, %{north: north, east: east, dir: "SOUTH" = dir}}) do
    %{north: north - 1, east: east, dir: dir}
  end

  def move({:error, message, position}) do
    IO.puts(message)
    position
  end
end

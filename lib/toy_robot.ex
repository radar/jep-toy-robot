require IEx
#source config/.env

defmodule ToyRobot do

  @moduledoc """
  Documentation for ToyRobot.
  """

  @doc """
  checks if robot is facing boundary, returns :ok if robot can move forward, :error if can't
  ## Examples
      iex> ToyRobot.check_boundary(%{north: 0, east: 0, dir: "NORTH"})
      {:ok, %{north: 0, east: 0, dir: "NORTH"}}

      iex> ToyRobot.check_boundary(%{north: 0, east: 0, dir: "WEST"})
      {:error, "Facing boundary, cannot move", %{north: 0, east: 0, dir: "WEST"}}
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
  

  @doc """
  Moves one space forward & returns new pos if check_boundary passes. Returns current pos if check_boundary fails
  ## Examples
      iex> ToyRobot.move(%{north: 0, east: 0, dir: "NORTH"})
      %{north: 1, east: 0, dir: "NORTH"}

      iex> %{north: 0, east: 4, dir: "EAST"} |> ToyRobot.move
      %{north: 0, east: 4, dir: "EAST"}
  """
  def move(%{north: _, east: _, dir: _} = position) do
    check_boundary(position)
    |> move()
  end

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

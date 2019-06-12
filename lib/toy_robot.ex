require IEx
#source config/.env

defmodule ToyRobot do

  defstruct [:north, :east, :dir]

  @moduledoc """
  Documentation for ToyRobot.
  """

  @doc """
  checks if robot is facing boundary, returns :ok if robot can move forward, :error if can't
  ## Examples
      iex> ToyRobot.check_boundary(%ToyRobot{north: 0, east: 0, dir: "NORTH"})
      {:ok, %ToyRobot{north: 0, east: 0, dir: "NORTH"}}

      iex> ToyRobot.check_boundary(%ToyRobot{north: 0, east: 0, dir: "WEST"})
      {:error, "Facing boundary, cannot move", %ToyRobot{north: 0, east: 0, dir: "WEST"}}
  """
  def check_boundary(%ToyRobot{north: 4, dir: "NORTH"} = position) do
    {:error, "Facing boundary, cannot move", position}
  end

  def check_boundary(%ToyRobot{north: 0, dir: "SOUTH"} = position) do
    {:error, "Facing boundary, cannot move", position}
  end

  def check_boundary(%ToyRobot{east: 4, dir: "EAST"} = position) do
    {:error, "Facing boundary, cannot move", position}
  end

  def check_boundary(%ToyRobot{east: 0, dir: "WEST"} = position) do
    {:error, "Facing boundary, cannot move", position}
  end

  def check_boundary(%ToyRobot{} = position) do
    {:ok, position}
  end
  

  @doc """
  Moves one space forward & returns new pos if check_boundary passes. Returns current pos if check_boundary fails
  ## Examples
      iex> ToyRobot.move(%ToyRobot{north: 0, east: 0, dir: "NORTH"})
      %ToyRobot{north: 1, east: 0, dir: "NORTH"}

      iex> %ToyRobot{north: 0, east: 4, dir: "EAST"} |> ToyRobot.move
      %ToyRobot{north: 0, east: 4, dir: "EAST"}
  """
  def move(position) when is_map(position) do
    check_boundary(position)
    |> move()
  end

  def move({:ok, %ToyRobot{north: north, dir: "NORTH"} = position}) do
    %{ position | north: north + 1 }
  end

  def move({:ok, %ToyRobot{east: east, dir: "EAST"} = position}) do
    %{position | east: east + 1}
  end

  def move({:ok, %ToyRobot{east: east, dir: "WEST"} = position}) do
    %{position | east: east - 1}
  end

  def move({:ok, %ToyRobot{north: north, dir: "SOUTH"} = position}) do
    %{position | north: north - 1}
  end

  def move({:error, message, position}) do
    IO.puts(message)
    position
  end

  @doc """
  Rotates position's dir property left or right by 90deg
  ## Examples
      iex> ToyRobot.rotate(%{north: 0, east: 0, dir: "NORTH"}, "LEFT")
      %{north: 0, east: 0, dir: "WEST"}

      iex> ToyRobot.rotate(%{north: 0, east: 0, dir: "EAST"}, "RIGHT")
      %{north: 0, east: 0, dir: "SOUTH"}
  """

  def rotate( %{dir: dir} = position, "LEFT") do
    new_dir = case dir do
      "NORTH" -> "WEST"
      "WEST" -> "SOUTH"
      "SOUTH" -> "EAST"
      "EAST" -> "NORTH"
    end
    %{ position | dir: new_dir }
  end

  def rotate( %{dir: dir} = position, "RIGHT") do
    new_dir = case dir do
      "NORTH" -> "EAST"
      "WEST" -> "NORTH"
      "SOUTH" -> "WEST"
      "EAST" -> "SOUTH"
    end
    %{ position | dir: new_dir }
  end


end

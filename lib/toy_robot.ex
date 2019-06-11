defmodule ToyRobot do
  @moduledoc """
  Documentation for ToyRobot.
  """

  @doc """
  Moves one space forward.

  ## Examples

      iex> ToyRobot.move(%{position: 0})
      %{position: 1}

      iex> %{position: 0} |> ToyRobot.move |> ToyRobot.move
      %{position: 2}
  """
  def move(%{position: position}) do
    %{position: position + 1}
  end
end

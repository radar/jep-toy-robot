defmodule ToyRobot.CLI do
  def main([filename]) do
    if File.exists?(filename) do
      filename
      |> read_commands
      |> run_commands
    else
      IO.puts "#{filename} does not exist"
    end
  end

  defp read_commands(filename) do
    File.stream!(filename)
    |> Enum.to_list
    |> Enum.map(&String.trim/1)
  end

  # run_commands/1
  defp run_commands(commands) do
    run_commands(commands, %{north: 0, east: 0, dir: "NORTH"})
  end

  # run_commands/2
  def run_commands(["MOVE" | commands], robot) do
    run_commands(commands, robot 
    |> ToyRobot.move)
  end

  def run_commands([], %{north: north, east: east, dir: dir}) do
    IO.puts "Robot is at position #{north}, #{east}, facing: #{dir}"
  end
end

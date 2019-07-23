defmodule ToyRobot.Router do
  use Plug.Router

  plug :match
  plug :dispatch

  post "/move" do
    robot = GenServer.call(ToyRobot.Game.Player, :move)
    send_resp(conn, 200, inspect(robot))    
  end

  post "/turn_left" do
    robot = GenServer.call(ToyRobot.Game.Player, :turn_left)
    send_resp(conn, 200, inspect(robot))
  end

  post "/turn_right" do
    robot = GenServer.call(ToyRobot.Game.Player, :turn_right)
    send_resp(conn, 200, inspect(robot))
  end

  get "/report" do
    robot = GenServer.call(ToyRobot.Game.Player, :report)
    send_resp(conn, 200, inspect(robot))
  end

  match _ do
    send_resp(conn, 404, "OOOOPPPSSSSS")
  end

end
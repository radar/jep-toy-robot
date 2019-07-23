defmodule ToyRobot.Router do
  use Plug.Router

  plug :match
  plug :dispatch

  post "/move" do
    robot = GenServer.call(ToyRobot.Game.Robot, :move)
    send_resp(conn, 200, inspect(robot))    
  end

  post "/turn_left" do
    robot = GenServer.call(ToyRobot.Game.Robot, :turn_left)
    send_resp(conn, 200, inspect(robot))
  end

  post "/turn_right" do
    robot = GenServer.call(ToyRobot.Game.Robot, :turn_right)
    send_resp(conn, 200, inspect(robot))
  end

  get "/report" do
    
  end

  match _ do
    send_resp(conn, 404, "OOOOPPPSSSSS")
  end

end
defmodule ToyRobot.Router do
  use Plug.Router
  alias ToyRobot.Game.Player
  @template_dir "lib/templates"

  plug(Plug.Parsers,
    parsers: [:json],
    pass: ["text/*"],
    json_decoder: Jason
  )

  plug(:match)
  plug(:dispatch)

  get "/" do
    render(conn, "index.html", player: [])
  end

  get "/move" do
    robot = GenServer.call(Player, :move)
    send_resp(conn, 200, inspect(robot))
  end

  get "/turn_left" do
    robot = GenServer.call(Player, :turn_left)
    send_resp(conn, 200, inspect(robot))
  end

  get "/turn_right" do
    robot = GenServer.call(Player, :turn_right)
    send_resp(conn, 200, inspect(robot))
  end

  get "/report" do
    robot = GenServer.call(Player, :report)
    send_resp(conn, 200, inspect(robot))
  end

  match _ do
    send_resp(conn, 404, "OOOOPPPSSSSS")
  end

  defp render(%{status: status} = conn, template, assigns \\ []) do
    body =
      @template_dir
      |> Path.join(template)
      |> String.replace_suffix(".html", ".html.eex")
      |> EEx.eval_file(assigns)

    send_resp(conn, status || 200, body)
  end

  defp render_json(%{status: status} = conn, data) do
    body = Jason.encode!(data)
    send_resp(conn, status || 200, body)
  end
end

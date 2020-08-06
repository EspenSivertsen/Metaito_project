defmodule MetaitoProjectWeb.PageController do
  use MetaitoProjectWeb, :controller

  def index(conn, _params) do
    #render(conn, "index.html")
    html(conn, File.read!("./priv/static/index.html"))
  end
end

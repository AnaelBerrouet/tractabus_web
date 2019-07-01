defmodule TractabusWeb.PageController do
  use TractabusWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end

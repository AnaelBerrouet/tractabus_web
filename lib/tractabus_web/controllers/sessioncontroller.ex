defmodule TractabusWeb.SessionController do
  alias Tractabus.Accounts
  import Plug.Conn

  use TractabusWeb, :controller

  def new(conn, _) do
    render(conn, "new.html")
  end

  def create(conn, %{"session" => %{"email" => email, "password" => password}}) do
    with {:ok, user} <- Accounts.validate_user(email, password) do
      conn
      |> put_session(:user_id, user.id)
      |> put_flash(:info, "Login succesful.")
      |> redirect(to: Routes.article_path(conn, :index))
    else
      _ ->
        conn
        |> put_flash(:error, "Login failed.")
        |> render("new.html")
    end
  end

  def delete(conn, _) do
    conn
    |> clear_session()
    |> put_flash(:info, "Logout succesful.")
    |> redirect(to: "/")
  end
end

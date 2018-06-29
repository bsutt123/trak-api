defmodule TrakWeb.PageController do
  use TrakWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end

defmodule CosmosdbExWeb.Controller do
  use CosmosdbExWeb, :controller

  @spec index(Plug.Conn.t(), %{String.t() => any()}) :: Plug.Conn.t()
  def index(connection, %{"collection" => collection}) do
    document = MongoDB.Client.find_one(collection, %{})
    json(connection, document)
  end

  @spec error(Plug.Conn.t(), %{String.t() => any()}) :: Plug.Conn.t()
  def error(connection, _params) do
    Plug.Conn.send_resp(connection, 404, "Not found")
  end
end

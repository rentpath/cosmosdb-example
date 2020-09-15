defmodule MongoDB.Repo do
  @moduledoc false

  @spec start_link(Keyword.t()) :: {:ok, pid()} | :ignore
  def start_link(options) do
    Mongo.start_link(options)
  end

  @spec child_spec(list()) :: map()
  def child_spec([]) do
    %{
      id: __MODULE__,
      start: {__MODULE__, :start_link, [[name: MongoDB, url: System.fetch_env!("COSMOSDB_URL")]]}
    }
  end
end

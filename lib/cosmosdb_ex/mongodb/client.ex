defmodule MongoDB.Client do
  @moduledoc false

  @spec find_one(String.t(), map()) :: map()
  def find_one(collection, document) do
    Mongo.find_one(MongoDB, collection, document, read_preference: %{mode: :nearest})
  rescue
    error in DBConnection.ConnectionError ->
      %{error: "DBConnection error: " <> error.message}

    error in Mongo.Error ->
      %{error: "MongoDB error: " <> error.message}
  end
end

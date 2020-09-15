use Mix.Config

config :cosmosdb_ex, CosmosdbExWeb.Endpoint,
  http: [
    port: String.to_integer(System.get_env("PORT") || "4000"),
    transport_options: [socket_opts: [:inet6]]
  ],
  server: true

config :logger, level: :info

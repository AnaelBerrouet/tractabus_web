defmodule Tractabus.Repo do
  use Ecto.Repo,
    otp_app: :tractabus,
    adapter: Ecto.Adapters.Postgres
end

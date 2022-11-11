defmodule ElixirlsSigilpRepro.Repo do
  use Ecto.Repo,
    otp_app: :elixirls_sigilp_repro,
    adapter: Ecto.Adapters.Postgres
end

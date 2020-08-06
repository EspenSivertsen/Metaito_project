defmodule MetaitoProject.Repo do
  use Ecto.Repo,
    otp_app: :metaito_project,
    adapter: Ecto.Adapters.Postgres
end

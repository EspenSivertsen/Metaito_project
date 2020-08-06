defmodule MetaitoProject.Repo.Migrations.CreateNotes do
  use Ecto.Migration

  def change do
    create table(:notes) do
      add :title, :string
      add :text, :string

      timestamps()
    end

  end
end

defmodule MetaitoProject.Memo.Notes do
  use Ecto.Schema
  import Ecto.Changeset

  schema "notes" do
    field :text, :string
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(notes, attrs) do
    notes
    |> cast(attrs, [:title, :text])
    |> validate_required([:title, :text])
  end
end

defmodule MetaitoProject.Splats.Links do
  use Ecto.Schema
  import Ecto.Changeset

  schema "links" do
    field :title, :string
    field :url, :string

    timestamps()
  end

  @doc false
  def changeset(links, attrs) do
    links
    |> cast(attrs, [:title, :url])
    |> validate_required([:title, :url])
  end
end

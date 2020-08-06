defmodule MetaitoProjectWeb.NotesView do
  use MetaitoProjectWeb, :view
  alias MetaitoProjectWeb.NotesView

  def render("index.json", %{notes: notes}) do
  %{
      notes: Enum.map(notes, &notes_json/1)
   }
  end
  def notes_json(note) do
    %{
       title: note.title,
       text: note.text
    }
  end

  def render("index.json", %{notes: notes}) do
    %{data: render_many(notes, NotesView, "notes.json")}
  end

  def render("show.json", %{notes: notes}) do
    %{data: render_one(notes, NotesView, "notes.json")}
  end

  def render("notes.json", %{notes: notes}) do
    %{id: notes.id,
      title: notes.title,
      text: notes.text}
  end
end

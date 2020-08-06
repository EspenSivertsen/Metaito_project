defmodule MetaitoProjectWeb.NotesController do
  use MetaitoProjectWeb, :controller

  alias MetaitoProject.Memo
  alias MetaitoProject.Memo.Notes

  action_fallback MetaitoProjectWeb.FallbackController

  def index(conn, _params) do
    notes = Memo.list_notes()
    render(conn, "index.json", notes: notes)
    notes = Repo.all(Notes)
  end

  def create(conn, %{"notes" => notes_params}) do
    with {:ok, %Notes{} = notes} <- Memo.create_notes(notes_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.notes_path(conn, :show, notes))
      |> render("show.json", notes: notes)
    end
  end

  def show(conn, %{"id" => id}) do
    notes = Memo.get_notes!(id)
    render(conn, "show.json", notes: notes)
  end

  def update(conn, %{"id" => id, "notes" => notes_params}) do
    notes = Memo.get_notes!(id)

    with {:ok, %Notes{} = notes} <- Memo.update_notes(notes, notes_params) do
      render(conn, "show.json", notes: notes)
    end
  end

  def delete(conn, %{"id" => id}) do
    notes = Memo.get_notes!(id)

    with {:ok, %Notes{}} <- Memo.delete_notes(notes) do
      send_resp(conn, :no_content, "")
    end
  end
end

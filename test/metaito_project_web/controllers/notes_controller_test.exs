defmodule MetaitoProjectWeb.NotesControllerTest do
  use MetaitoProjectWeb.ConnCase

  alias MetaitoProject.Memo
  alias MetaitoProject.Memo.Notes

  @create_attrs %{
    text: "some text",
    title: "some title"
  }
  @update_attrs %{
    text: "some updated text",
    title: "some updated title"
  }
  @invalid_attrs %{text: nil, title: nil}

  def fixture(:notes) do
    {:ok, notes} = Memo.create_notes(@create_attrs)
    notes
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all notes", %{conn: conn} do
      conn = get(conn, Routes.notes_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create notes" do
    test "renders notes when data is valid", %{conn: conn} do
      conn = post(conn, Routes.notes_path(conn, :create), notes: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.notes_path(conn, :show, id))

      assert %{
               "id" => id,
               "text" => "some text",
               "title" => "some title"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.notes_path(conn, :create), notes: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update notes" do
    setup [:create_notes]

    test "renders notes when data is valid", %{conn: conn, notes: %Notes{id: id} = notes} do
      conn = put(conn, Routes.notes_path(conn, :update, notes), notes: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.notes_path(conn, :show, id))

      assert %{
               "id" => id,
               "text" => "some updated text",
               "title" => "some updated title"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, notes: notes} do
      conn = put(conn, Routes.notes_path(conn, :update, notes), notes: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete notes" do
    setup [:create_notes]

    test "deletes chosen notes", %{conn: conn, notes: notes} do
      conn = delete(conn, Routes.notes_path(conn, :delete, notes))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.notes_path(conn, :show, notes))
      end
    end
  end

  defp create_notes(_) do
    notes = fixture(:notes)
    %{notes: notes}
  end
end

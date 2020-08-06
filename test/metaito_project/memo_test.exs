defmodule MetaitoProject.MemoTest do
  use MetaitoProject.DataCase

  alias MetaitoProject.Memo

  describe "notes" do
    alias MetaitoProject.Memo.Notes

    @valid_attrs %{text: "some text", title: "some title"}
    @update_attrs %{text: "some updated text", title: "some updated title"}
    @invalid_attrs %{text: nil, title: nil}

    def notes_fixture(attrs \\ %{}) do
      {:ok, notes} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Memo.create_notes()

      notes
    end

    test "list_notes/0 returns all notes" do
      notes = notes_fixture()
      assert Memo.list_notes() == [notes]
    end

    test "get_notes!/1 returns the notes with given id" do
      notes = notes_fixture()
      assert Memo.get_notes!(notes.id) == notes
    end

    test "create_notes/1 with valid data creates a notes" do
      assert {:ok, %Notes{} = notes} = Memo.create_notes(@valid_attrs)
      assert notes.text == "some text"
      assert notes.title == "some title"
    end

    test "create_notes/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Memo.create_notes(@invalid_attrs)
    end

    test "update_notes/2 with valid data updates the notes" do
      notes = notes_fixture()
      assert {:ok, %Notes{} = notes} = Memo.update_notes(notes, @update_attrs)
      assert notes.text == "some updated text"
      assert notes.title == "some updated title"
    end

    test "update_notes/2 with invalid data returns error changeset" do
      notes = notes_fixture()
      assert {:error, %Ecto.Changeset{}} = Memo.update_notes(notes, @invalid_attrs)
      assert notes == Memo.get_notes!(notes.id)
    end

    test "delete_notes/1 deletes the notes" do
      notes = notes_fixture()
      assert {:ok, %Notes{}} = Memo.delete_notes(notes)
      assert_raise Ecto.NoResultsError, fn -> Memo.get_notes!(notes.id) end
    end

    test "change_notes/1 returns a notes changeset" do
      notes = notes_fixture()
      assert %Ecto.Changeset{} = Memo.change_notes(notes)
    end
  end
end

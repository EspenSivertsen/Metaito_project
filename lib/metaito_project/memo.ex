defmodule MetaitoProject.Memo do
  @moduledoc """
  The Memo context.
  """

  import Ecto.Query, warn: false
  alias MetaitoProject.Repo

  alias MetaitoProject.Memo.Notes

  @doc """
  Returns the list of notes.

  ## Examples

      iex> list_notes()
      [%Notes{}, ...]

  """
  def list_notes do
    Repo.all(Notes)
  end

  @doc """
  Gets a single notes.

  Raises `Ecto.NoResultsError` if the Notes does not exist.

  ## Examples

      iex> get_notes!(123)
      %Notes{}

      iex> get_notes!(456)
      ** (Ecto.NoResultsError)

  """
  def get_notes!(id), do: Repo.get!(Notes, id)

  @doc """
  Creates a notes.

  ## Examples

      iex> create_notes(%{field: value})
      {:ok, %Notes{}}

      iex> create_notes(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_notes(attrs \\ %{}) do
    %Notes{}
    |> Notes.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a notes.

  ## Examples

      iex> update_notes(notes, %{field: new_value})
      {:ok, %Notes{}}

      iex> update_notes(notes, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_notes(%Notes{} = notes, attrs) do
    notes
    |> Notes.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a notes.

  ## Examples

      iex> delete_notes(notes)
      {:ok, %Notes{}}

      iex> delete_notes(notes)
      {:error, %Ecto.Changeset{}}

  """
  def delete_notes(%Notes{} = notes) do
    Repo.delete(notes)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking notes changes.

  ## Examples

      iex> change_notes(notes)
      %Ecto.Changeset{data: %Notes{}}

  """
  def change_notes(%Notes{} = notes, attrs \\ %{}) do
    Notes.changeset(notes, attrs)
  end
end

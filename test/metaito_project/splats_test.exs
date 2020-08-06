defmodule MetaitoProject.SplatsTest do
  use MetaitoProject.DataCase

  alias MetaitoProject.Splats

  describe "links" do
    alias MetaitoProject.Splats.Links

    @valid_attrs %{title: "some title", url: "some url"}
    @update_attrs %{title: "some updated title", url: "some updated url"}
    @invalid_attrs %{title: nil, url: nil}

    def links_fixture(attrs \\ %{}) do
      {:ok, links} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Splats.create_links()

      links
    end

    test "list_links/0 returns all links" do
      links = links_fixture()
      assert Splats.list_links() == [links]
    end

    test "get_links!/1 returns the links with given id" do
      links = links_fixture()
      assert Splats.get_links!(links.id) == links
    end

    test "create_links/1 with valid data creates a links" do
      assert {:ok, %Links{} = links} = Splats.create_links(@valid_attrs)
      assert links.title == "some title"
      assert links.url == "some url"
    end

    test "create_links/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Splats.create_links(@invalid_attrs)
    end

    test "update_links/2 with valid data updates the links" do
      links = links_fixture()
      assert {:ok, %Links{} = links} = Splats.update_links(links, @update_attrs)
      assert links.title == "some updated title"
      assert links.url == "some updated url"
    end

    test "update_links/2 with invalid data returns error changeset" do
      links = links_fixture()
      assert {:error, %Ecto.Changeset{}} = Splats.update_links(links, @invalid_attrs)
      assert links == Splats.get_links!(links.id)
    end

    test "delete_links/1 deletes the links" do
      links = links_fixture()
      assert {:ok, %Links{}} = Splats.delete_links(links)
      assert_raise Ecto.NoResultsError, fn -> Splats.get_links!(links.id) end
    end

    test "change_links/1 returns a links changeset" do
      links = links_fixture()
      assert %Ecto.Changeset{} = Splats.change_links(links)
    end
  end
end

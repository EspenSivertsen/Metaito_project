defmodule MetaitoProjectWeb.LinksControllerTest do
  use MetaitoProjectWeb.ConnCase

  alias MetaitoProject.Splats
  alias MetaitoProject.Splats.Links

  @create_attrs %{
    title: "some title",
    url: "some url"
  }
  @update_attrs %{
    title: "some updated title",
    url: "some updated url"
  }
  @invalid_attrs %{title: nil, url: nil}

  def fixture(:links) do
    {:ok, links} = Splats.create_links(@create_attrs)
    links
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all links", %{conn: conn} do
      conn = get(conn, Routes.links_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create links" do
    test "renders links when data is valid", %{conn: conn} do
      conn = post(conn, Routes.links_path(conn, :create), links: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.links_path(conn, :show, id))

      assert %{
               "id" => id,
               "title" => "some title",
               "url" => "some url"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.links_path(conn, :create), links: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update links" do
    setup [:create_links]

    test "renders links when data is valid", %{conn: conn, links: %Links{id: id} = links} do
      conn = put(conn, Routes.links_path(conn, :update, links), links: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.links_path(conn, :show, id))

      assert %{
               "id" => id,
               "title" => "some updated title",
               "url" => "some updated url"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, links: links} do
      conn = put(conn, Routes.links_path(conn, :update, links), links: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete links" do
    setup [:create_links]

    test "deletes chosen links", %{conn: conn, links: links} do
      conn = delete(conn, Routes.links_path(conn, :delete, links))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.links_path(conn, :show, links))
      end
    end
  end

  defp create_links(_) do
    links = fixture(:links)
    %{links: links}
  end
end

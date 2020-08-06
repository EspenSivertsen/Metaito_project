defmodule MetaitoProjectWeb.LinksController do
  use MetaitoProjectWeb, :controller

  alias MetaitoProject.Splats
  alias MetaitoProject.Splats.Links

  action_fallback MetaitoProjectWeb.FallbackController

  def index(conn, _params) do
    links = Splats.list_links()
    render(conn, "index.json", links: links)
    links = Repo.all(Links)
  end

  def create(conn, %{"links" => links_params}) do
    with {:ok, %Links{} = links} <- Splats.create_links(links_params) do
      conn
      |> put_status(:create)
      |> put_resp_header("location", Routes.links_path(conn, :show, links))
      |> render("show.json", links: links)

      changeset = Links.changeset(%Links{}, links_params)

      case Repo.insert(changeset) do
        {:ok, _links} ->
          links = Repo.all(Links)
          render(conn, "index.json", links: links)
      end
    end
  end

  def show(conn, %{"id" => id}) do
    links = Splats.get_links!(id)
    render(conn, "show.json", links: links)
  end

  def update(conn, %{"id" => id, "links" => links_params}) do
    links = Splats.get_links!(id)

    with {:ok, %Links{} = links} <- Splats.update_links(links, links_params) do
      render(conn, "show.json", links: links)
    end
  end

  def delete(conn, %{"id" => id}) do
    links = Splats.get_links!(id)

    with {:ok, %Links{}} <- Splats.delete_links(links) do
      send_resp(conn, :no_content, "")
    end
  end
end

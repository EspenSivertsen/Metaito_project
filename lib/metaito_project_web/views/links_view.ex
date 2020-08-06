defmodule MetaitoProjectWeb.LinksView do
  use MetaitoProjectWeb, :view
  alias MetaitoProjectWeb.LinksView

  def render("index.json", %{links: links}) do
  %{
      links: Enum.map(links, &links_json/1)
   }
  end
  def links_json(link) do
    %{
       title: link.title,
       url: link.url
    }
  end

  def render("index.json", %{links: links}) do
    %{data: render_many(links, LinksView, "links.json")}
  end

  def render("show.json", %{links: links}) do
    %{data: render_one(links, LinksView, "links.json")}
  end

  def render("links.json", %{links: links}) do
    %{id: links.id,
      title: links.title,
      url: links.url}
  end
end

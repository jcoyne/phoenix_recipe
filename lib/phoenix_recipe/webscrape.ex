defmodule PhoenixRecipe.Webscrape do
  def collect([]) do
    {:error, "Must provide a URL"}
  end

  def collect([url | _]) do
    {:ok, html} = download_page(url)
    {:ok, ld} = extract_ld(html)
    IO.puts "Got #{ld}"
  end

  defp extract_ld(html) do
    matches = Floki.find(html, "script[type=\"application/ld+json\"]")
    [tag | _ ] = matches
    {_, _, contents} = tag
    {:ok, contents }
  end

  defp download_page(url) do
    IO.puts "get page #{url}"
    HTTPotion.start
    response = HTTPotion.get url
    {:ok, response.body}
  end
end

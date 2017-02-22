defmodule Mix.Tasks.Import do
  use Mix.Task

  @shortdoc "Runs the Import.say/1 command."
  def run(url) do
    {:ok, ld} = PhoenixRecipe.Webscrape.collect(url)
    changeset = PhoenixRecipe.Recipe.changeset(%PhoenixRecipe.Recipe{}, %{ name: Map.get(ld, "name"), rdf: ld })
    Mix.Task.run "app.start", []
    case PhoenixRecipe.Repo.insert(changeset) do
      {:ok, _recipe} ->
        IO.puts "success"
      {:error, changeset} ->
        IO.inspect changeset
    end
  end

  def run() do
    IO.puts "Pass a parameter"
  end
end

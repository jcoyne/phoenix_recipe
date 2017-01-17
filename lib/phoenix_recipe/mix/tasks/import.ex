defmodule Mix.Tasks.Import do
  use Mix.Task

  @shortdoc "Runs the Import.say/1 command."
  def run(url) do
    IO.puts "importing"
    PhoenixRecipe.Webscrape.collect(url)
  end

  def run() do
    IO.puts "Pass a parameter"
  end
end

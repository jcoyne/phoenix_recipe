defmodule PhoenixRecipe.RecipeView do
  use PhoenixRecipe.Web, :view

  def render("index.json", %{recipes: recipes}) do
    as_json = Enum.map(recipes, fn(recipe) ->
      Map.merge(recipe.rdf, %{id: recipe.id})
    end
    )
    %{"recipes" => as_json}
  end
end

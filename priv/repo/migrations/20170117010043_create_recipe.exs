defmodule PhoenixRecipe.Repo.Migrations.CreateRecipe do
  use Ecto.Migration

  def change do
    create table(:recipes) do
      add :name, :string
      add :rdf, :map

      timestamps()
    end

  end
end

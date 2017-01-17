defmodule PhoenixRecipe.Recipe do
  use PhoenixRecipe.Web, :model

  schema "recipes" do
    field :name, :string
    field :rdf, :map

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :rdf])
    |> validate_required([:name, :rdf])
  end
end

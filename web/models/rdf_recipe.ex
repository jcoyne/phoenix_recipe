defmodule RdfRecipe do
  use PhoenixRecipe.Web, :model

  # embedded_schema is short for:
  #
  #   @primary_key {:id, :binary_id, autogenerate: true}
  #   schema "embedded Item" do
  #
  embedded_schema do
    field :"@context"
    field :"@type"
    field :name
  end
end

defimpl Phoenix.HTML.Safe, for: RdfRecipe do
  def to_iodata(data) do
    data
  end
end

defmodule Tractabus.Articles.Article do
  use Ecto.Schema
  import Ecto.Changeset

  schema "articles" do
    field :pagerank, :float
    field :readability, :float
    field :title, :string
    field :word_count, :integer

    timestamps()
  end

  @doc false
  def changeset(article, attrs) do
    article
    |> cast(attrs, [:title, :pagerank, :readability, :word_count])
    |> validate_required([:title, :pagerank, :readability, :word_count])
  end
end

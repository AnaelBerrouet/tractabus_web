defmodule Tractabus.Repo.Migrations.CreateArticles do
  use Ecto.Migration

  def change do
    create table(:articles) do
      add :title, :string, null: false
      add :pagerank, :float, null: false
      add :readability, :float, null: false
      add :word_count, :integer, null: false

      timestamps()
    end

  end
end

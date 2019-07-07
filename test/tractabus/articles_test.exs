defmodule Tractabus.ArticlesTest do
  use Tractabus.DataCase

  alias Tractabus.Articles

  describe "articles" do
    alias Tractabus.Articles.Article

    @valid_attrs %{pagerank: 120.5, readability: 120.5, title: "some title", word_count: 42}
    @update_attrs %{pagerank: 456.7, readability: 456.7, title: "some updated title", word_count: 43}
    @invalid_attrs %{pagerank: nil, readability: nil, title: nil, word_count: nil}

    def article_fixture(attrs \\ %{}) do
      {:ok, article} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Articles.create_article()

      article
    end

    test "list_articles/0 returns all articles" do
      article = article_fixture()
      assert Articles.list_articles() == [article]
    end

    test "get_article!/1 returns the article with given id" do
      article = article_fixture()
      assert Articles.get_article!(article.id) == article
    end

    test "create_article/1 with valid data creates a article" do
      assert {:ok, %Article{} = article} = Articles.create_article(@valid_attrs)
      assert article.pagerank == 120.5
      assert article.readability == 120.5
      assert article.title == "some title"
      assert article.word_count == 42
    end

    test "create_article/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Articles.create_article(@invalid_attrs)
    end

    test "update_article/2 with valid data updates the article" do
      article = article_fixture()
      assert {:ok, %Article{} = article} = Articles.update_article(article, @update_attrs)
      assert article.pagerank == 456.7
      assert article.readability == 456.7
      assert article.title == "some updated title"
      assert article.word_count == 43
    end

    test "update_article/2 with invalid data returns error changeset" do
      article = article_fixture()
      assert {:error, %Ecto.Changeset{}} = Articles.update_article(article, @invalid_attrs)
      assert article == Articles.get_article!(article.id)
    end

    test "delete_article/1 deletes the article" do
      article = article_fixture()
      assert {:ok, %Article{}} = Articles.delete_article(article)
      assert_raise Ecto.NoResultsError, fn -> Articles.get_article!(article.id) end
    end

    test "change_article/1 returns a article changeset" do
      article = article_fixture()
      assert %Ecto.Changeset{} = Articles.change_article(article)
    end
  end
end

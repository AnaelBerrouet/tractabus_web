defmodule TractabusWeb.ArticleView do
  use TractabusWeb, :view

  def format_readability(score) do
    cond do
      score < 9 ->
        '<span class="badge badge-pill badge-primary">Primary</span>'
      score >= 9 && score < 13 ->
        '<span class="badge badge-pill badge-warning">Secondary</span>'
      true ->
        "<span class='badge badge-pill badge-success'>University</span>"
    end
  end

  def format_title(title) do
    link = "https://en.wikipedia.org/wiki/"
    "<a href='#{link}#{title}'>#{title}</a>"
  end

  def format_pagerank(pagerank) do
    Float.round(pagerank * 1.0e05, 1)
  end
end

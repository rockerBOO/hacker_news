defmodule HackerNews do
  @moduledoc """
  HackerNews application

  """

  alias HackerNews.Request
  alias HackerNews.Response

  def top_list() do 
    Request.get("topstories")
    |> Response.handle_response()
    |> case do 
      {:ok, body} -> body
      {:error, error} -> raise error
    end
  end

  def populate_top_list(top_list) do
    top_list
    |> Stream.map(fn x -> 
      Request.get("item/#{Integer.to_string(x)}")
      |> Response.handle_response()
      |> case do 
        {:ok, body} -> body
        {:error, error} -> raise error
      end
    end)
  end

  def top_list_print(opts \\ []) do
    top_list()
    |> populate_top_list()
    |> Stream.map(fn map ->
      %{"title" => map["title"], "url" => map["url"]}
    end)
    |> Enum.take(Keyword.get(opts, :limit, 10))
    |> Enum.each(fn {title, url} ->
      IO.puts title
      IO.puts url
    end)
  end


end

defmodule HackerNews.Request do 
  @moduledoc """
  HTTP Request module
  """

  use HTTPoison.Base

  def process_url(url) do
    "https://hacker-news.firebaseio.com/v0/#{url}.json"
  end

  def process_response_body(body) do
    body |> Poison.decode!()
  end
end
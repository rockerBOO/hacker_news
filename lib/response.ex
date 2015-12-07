defmodule HackerNews.Response do 
  @moduledoc """
  Handles HTTP Responses
  """

  @doc """
  Converts HTTPoison.Response to specific response
  """
  def handle_response(response) do 
    case response do 
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        {:ok, body}
      {:ok, %HTTPoison.Response{status_code: 404}} ->
        {:error, "Not found"}
      {:error, %HTTPoison.Error{reason: reason}} ->
        {:error, reason}
    end
  end
end
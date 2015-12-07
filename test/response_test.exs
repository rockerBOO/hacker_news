defmodule HackerNews.ResponseTest do 
  use ExUnit.Case

	test "Test response tuples" do 
		two_hundred = {:ok, %HTTPoison.Response{status_code: 200, body: ""}}
		four_hundred_four = {:ok, %HTTPoison.Response{status_code: 404}}

		assert {:ok, ""} == HackerNews.Response.handle_response(two_hundred)

		assert {:error, "Not found"} == HackerNews.Response.handle_response(four_hundred_four)
	end
end
defmodule HackerNewsTest do
  use ExUnit.Case
  doctest HackerNews

  test "the truth" do
    assert 1 + 1 == 2
  end

  test "populate top list" do 
    top_list = [10684447, 10686676, 10687375, 10687471, 
     10686841, 10687134, 10687798, 10684343,
     10686336, 10686644]

    response =  [%{
      "title" => "Van Eck Phreaking",
      "url" => "https://en.wikipedia.org/wiki/Van_Eck_phreaking"
    }]

    assert response == top_list 
    |> HackerNews.populate_top_list 
    |> Stream.map(fn map ->
      %{"title" => map["title"], "url" => map["url"]}
    end)
    |> Enum.take(1)

  end
end

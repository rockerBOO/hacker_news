# HackerNews

Simple Wrapper to [Hacker News](https://news.ycombinator.com/) using [HTTPoison](https://github.com/edgurgel/httpoison)

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

  1. Add hacker_news to your list of dependencies in `mix.exs`:

        def deps do
          [{:hacker_news, "~> 0.0.1"}]
        end

  2. Ensure hacker_news is started before your application:

        def application do
          [applications: [:hacker_news]]
        end

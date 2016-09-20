defmodule GuildwarsEx.TradingPost.CommerceListing do
  use HTTPoison.Base

  @base_url "https://api.guildwars2.com/v2/"

  def process_url(item_id) do
    @base_url <> "commerce/listings/" <> item_id
  end

  def process_response_body(body) do
    body
    |> JSX.decode!
  end

  def get_info(item_id) do
    with result = get!(item_id), do: result.body
  end
end

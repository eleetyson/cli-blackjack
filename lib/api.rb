class API

  # need to send two separate HTTP GET requests
  # first is to get a deck of cards -- only need one
  # second to get all 52 cards from that deck -- ignoring the other information
  # use the response to instantiate a Blackjack instance
  def self.get_new_deck
    response1 = HTTParty.get("https://deckofcardsapi.com/api/deck/new/shuffle/?deck_count=1")
    deck_id = response1["deck_id"]
    response2 = HTTParty.get("https://deckofcardsapi.com/api/deck/#{deck_id}/draw/?count=52")
    cards = response2["cards"]
    Blackjack.new(cards)
  end

end

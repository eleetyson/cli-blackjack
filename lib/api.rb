class API
  @@deck_id = "9q0rrjv2o7r3"
  # need to send two separate HTTP GET requests
  # first is to shuffle our deck of cards
  # second to get all 52 cards from that deck -- ignoring the other information
  # use the response to instantiate a Blackjack instance
  def self.get_new_deck
    HTTParty.get("https://deckofcardsapi.com/api/deck/#{@@deck_id}/shuffle/")
    response = HTTParty.get("https://deckofcardsapi.com/api/deck/#{@@deck_id}/draw/?count=52") # returns a hash of data
    cards = response["cards"] # we only want the "cards" key and its corresponding value
    Blackjack.new(cards)
  end

end

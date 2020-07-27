class API

  # send an HTTP GET request
  # use the response to instantiate a Blackjack instance
  def self.get_new_deck
    response = HTTParty.get("https://deckofcardsapi.com/api/deck/new/draw/?count=52")
    Blackjack.new(response["deck_id"], response["cards"])
  end

end

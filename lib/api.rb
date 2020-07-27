class API

  def self.get_new_deck
    response = HTTParty.get("https://deckofcardsapi.com/api/deck/new/draw/?count=52")
    Blackjack.new(response["deck_id"], response["cards"])
  end

end

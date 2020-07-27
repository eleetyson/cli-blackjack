class Blackjack

  def initialize(cards)
    @cards = cards
    @player = []
    @dealer = []
  end

  # draw a card for the player (pick a random element from the @cards array and add it to the player's hand)
  def player_draw
    @player << @cards.sample
  end

  # draw a card for the dealer (pick a random element from the @cards array and add it to the dealer's hand)
  def dealer_draw
    @dealer << @cards.sample
  end

  # discard the player's hand (empty the @player array)
  def player_discard
    @player.clear
  end

  # discard the dealer's hand (empty the @dealer array)
  def dealer_discard
    @dealer.clear
  end

end

class Blackjack
  attr_accessor :deck_id, :deck, :player, :dealer

  # @@all = []

  def initialize(deck_id, deck)
    @deck_id = deck_id
    @deck = deck
    @player = []
    @dealer = []
    # self.save
  end

  # def save
  #   self.class.all << self
  # end
  #
  # def self.all
  #   @@all
  # end

  # draw a card for the player (pick a random card hash from the @deck array and add it to the player's hand -- @player)
  def player_draw
    self.player << self.deck.sample
  end

  # draw a card for the dealer (pick a random card hash from the @deck array and add it to the dealer's hand -- @dealer)
  def dealer_draw
    self.dealer << self.deck.sample
  end

  # discard the player's hand (empty the @player array)
  def player_discard
    self.player.clear
  end

  # discard the dealer's hand (empty the @dealer array)
  def dealer_discard
    self.dealer.clear
  end

end

class Blackjack
  attr_accessor :deck_id, :deck, :player, :dealer

  # @@all = []

  def initialize(deck_id, deck)
    @deck_id = deck_id
    @deck = deck
    @player = []
    @dealer = []
    # self.save
    binding.pry
  end

  # def save
  #   self.class.all << self
  # end
  #
  # def self.all
  #   @@all
  # end

  # draw a random card (a hash) from the deck and add it to the player's hand
  def player_draw
    self.player << self.deck.sample
  end

  # draw a random card (a hash) from the deck and add it to the dealer's hand
  def dealer_draw
    self.dealer << self.deck.sample
  end

end

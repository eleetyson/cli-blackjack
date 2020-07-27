class Blackjack
  attr_reader :cards, :player, :dealer
  @@all = []

  def initialize(cards)
    @cards = cards
    @player = []
    @dealer = []
    self.save
  end

  # save the instance to the @@all array
  def save
    self.class.all << self
  end

  # draw a card for the player
  def self.player_draw
    self.all.player << self.all.cards.sample
  end

  # draw a card for the dealer
  def self.dealer_draw
    self.all.dealer << self.all.cards.sample
  end

  # discard the player's hand
  def self.player_discard
    self.all.player.clear
  end

  # discard the dealer's hand
  def self.dealer_discard
    self.all.dealer.clear
  end

  # reader for the @@all variable
  def self.all
    @@all
  end

end

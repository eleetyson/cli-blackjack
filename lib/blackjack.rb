class Blackjack
  # attr_accessor :deck_id, :deck, :player, :dealer
  attr_reader :deck_id, :deck, :player, :dealer

  @@all = []

  def initialize(deck_id, deck)
    @deck_id = deck_id
    @deck = deck
    @player = []
    @dealer = []
    self.save
  end

  # store the current instance in the @@all array
  def save
    self.class.all << self
  end

  # draw a card for the player (pick a random card hash from the @deck array and add it to the player's hand)
  def self.player_draw
    self.all.player << self.deck.sample
  end

  # draw a card for the dealer (pick a random card hash from the @deck array and add it to the dealer's hand)
  def self.dealer_draw
    self.all.dealer << self.deck.sample
  end

  # discard the player's hand (empty the player array in @@all)
  def self.player_discard
    self.all.player.clear
  end

  # discard the dealer's hand (empty the dealer array in @@all)
  def self.dealer_discard
    self.all.dealer.clear
  end

  # class method that references the @@all array in a more abstract, flexible way
  def self.all
    @@all
  end

  # empty out the @@all array
  def self.empty
    self.all.clear
  end

end

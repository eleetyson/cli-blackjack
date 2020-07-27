class Blackjack
  attr_accessor :deck_id, :cards

  # @@all = []

  def initialize(deck_id, cards)
    @deck_id = deck_id
    @cards = cards
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

end

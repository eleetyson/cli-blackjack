class Blackjack
  @@all = {}

  def initialize(cards)
    self.class.all[:deck] = cards
    self.class.all[:player] = []
    self.class.all[:dealer] = []
  end

  def self.player_hand
    self.all[:player].map do |card|
      if card["value"] == "KING" || card["value"] == "QUEEN" || card["value"] == "JACK"
        10
      elsif card["value"] == "ACE"
        1
      else
        card["value"].to_i
      end
    end
  end

  def self.dealer_hand
    self.all[:dealer].map do |card|
      if card["value"] == "KING" || card["value"] == "QUEEN" || card["value"] == "JACK"
        10
      elsif card["value"] == "ACE"
        1
      else
        card["value"].to_i
      end
    end
  end

  def self.dealer_show_one
    # self.all[:dealer]
  end

  # draw a card for the player
  def self.player_draw
    self.all[:player] << self.all[:deck].sample
  end

  # draw a card for the dealer
  def self.dealer_draw
    self.all[:dealer] << self.all[:deck].sample
  end

  # discard the player's hand
  def self.player_discard
    self.all[:player].clear
  end

  # discard the dealer's hand
  def self.dealer_discard
    self.all[:dealer].clear
  end

  # reader for the @@all variable
  def self.all
    @@all
  end

end

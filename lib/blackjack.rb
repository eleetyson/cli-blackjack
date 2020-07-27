class Blackjack
  @@all = {}

  def initialize(cards)
    self.class.all[:deck] = cards
    self.class.all[:player] = []
    self.class.all[:dealer] = []
  end

  # display the user's current hand as an array
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

  # display the dealer's current hand as an array
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

  # display only the dealer's first card (simulates another face down card)
  def self.dealer_show_one
    [self.dealer_hand.first]
  end

  # draw a card for the user
  def self.player_draw
    self.all[:player] << self.all[:deck].sample
  end

  # draw a card for the dealer
  def self.dealer_draw
    self.all[:dealer] << self.all[:deck].sample
  end

  # draw two cards for the user
  def self.player_draw_two
    self.player_draw
    self.player_draw
  end

  # draw two cards for the dealer
  def self.dealer_draw_two
    self.dealer_draw
    self.dealer_draw
  end

  # check whether the player has 21
  def self.player_blackjack?
    self.player_hand.sum == 21 ? true : false
  end

  # check whether the dealer has 21
  def self.dealer_blackjack?
    self.dealer_hand.sum == 21 ? true : false
  end

  # check whether the user's hand is over 21
  def self.player_over_21?
    self.player_hand.sum > 21 ? true : false
  end

  # check whether the dealer's hand is over 21
  def self.dealer_over_21?
    self.dealer_hand.sum > 21 ? true : false
  end

  # check if the dealer's hand totals 17 or over
  def self.dealer_17?
    self.dealer_hand.sum >= 17 ? true : false
  end

  # discard the user and dealer's hands
  def self.discard
    self.all[:player].clear
    self.all[:dealer].clear
  end

  # reader for the @@all array
  def self.all
    @@all
  end

end

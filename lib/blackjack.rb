class Blackjack
  attr_accessor :player, :dealer, :deck, :player_winnings, :bet

  @@all = []

  def initialize(cards)
    @player = []
    @dealer = []
    @deck = cards
    @player_winnings = 100
    @bet = 0
    self.save
  end

  # store the instance in the @@all array
  def save
    self.class.all << self
  end

  # display the user's current hand as an array
  def player_hand
    self.player.map do |card|

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
  def dealer_hand
    self.dealer.map do |card|

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
  def dealer_show_one
    [self.dealer_hand.first]
  end

  # display the player's last card
  def player_show_last
    [self.player_hand.last]
  end

   # draw a card for the user
  def player_draw
    self.player << self.deck.sample
  end

  # draw a card for the user
  def dealer_draw
    self.dealer << self.deck.sample
  end

  # draw two cards for the user
  def player_draw_two
    self.player_draw
    self.player_draw
  end

  # draw two cards for the dealer
  def dealer_draw_two
    self.dealer_draw
    self.dealer_draw
  end

  # check whether the player has 21
  def player_blackjack?
    self.player_hand.sum == 21
  end

  # check whether the dealer has 21
  def dealer_blackjack?
    self.dealer_hand.sum == 21
  end

  # check whether the user's hand is over 21
  def player_over_21?
    self.player_hand.sum > 21
  end

  # check whether the dealer's hand is over 21
  def dealer_over_21?
    self.dealer_hand.sum > 21
  end

  # check if the dealer's hand totals 17 or over
  def dealer_17?
    self.dealer_hand.sum >= 17
  end

  # discard the user and dealer's hands
  def discard
    self.player.clear
    self.dealer.clear
  end

  # returns whether the user has any money left
  def money_left?
    self.player_winnings > 0
  end

  # adds to the player's winnings by amount
  def add_player_winnings(amount)
    self.player_winnings += amount
  end

  # subtracts from the player's winnings by amount
  def subtract_player_winnings(amount)
    self.player_winnings -= amount
  end

  # reader for the @@all array
  def self.all
    @@all
  end

end

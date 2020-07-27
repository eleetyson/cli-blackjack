class CLI

  # greet the user
  def greeting
    puts "------------------------"
    puts "Welcome to CLI Blackjack"
    puts "------------------------"
  end

  # give user option to play or exit the game
  def start_menu
    print "Enter 'y' to play or 'n' to exit: "
    input = gets.strip.upcase # standardize and store user's input

    if input == "Y" # start the game if user wants to play
      self.start_game
    elsif input == "N" # allow user to exit
      self.exit
    else
      puts "* please enter either 'y' or 'n' *"
      self.start_menu # loop this method until user makes a valid choice
    end

  end

  # get a deck of cards and then deal a hand
  def start_game
    API.get_new_deck
    self.deal_hand
  end

  # draw and display hands for the user and dealer
  def deal_hand
    Blackjack.player_draw_two
    Blackjack.dealer_draw_two
    puts "------------------------"
    puts "Your cards are the following: #{Blackjack.player_hand}"
    puts "The dealer has: #{Blackjack.dealer_show_one} and another card that's face down"
    # only play out hand if user doesn't have 21 already
    Blackjack.player_blackjack? ? self.winner_winner : self.play
  end

  # give user option to hit or stand
  def play
    print "Enter 'h' to hit or 's' to stand: "
    input = gets.strip.upcase

    if input == "H"
      self.player_hit
    elsif input == "S"
      self.stand
    else
      puts "* please enter either 'h' or 's' *"
      self.play # this method loops until given a valid input
    end

  end

  # draw a card for the user and display both hands
  def player_hit
    Blackjack.player_draw
    puts "------------------------"
    puts "You drew a #{Blackjack.player_hand.last}"
    puts "Your cards are now the following: #{Blackjack.player_hand} --> #{Blackjack.player_hand.sum}"
    puts "The dealer still has: #{Blackjack.dealer_show_one} and another card that's face down"

    # if user hasn't busted or hit 21, revert to #play
    if Blackjack.player_over_21?
      self.player_bust
    elsif Blackjack.player_blackjack?
      self.player_winner_winner
    else
      self.play
    end

  end

  # per convention after user stands, dealer must draw until hand totals 17 or over
  def stand
    if Blackjack.dealer_17? # once dealer's cards total 17 or over...

      if Blackjack.dealer_blackjack? # check for dealer blackjack
        self.dealer_winner_winner
      elsif Blackjack.dealer_over_21? # check for dealer bust
        self.dealer_bust
      else
        self.evaluate # if dealer didn't bust or get blackjack, need to check who won
      end

    else # otherwise, draw another card and loop this method
      Blackjack.dealer_draw
      self.stand
    end

  end

  def status
    puts "You: #{Blackjack.player_hand} --> #{Blackjack.player_hand.sum}"
    puts "Dealer: #{Blackjack.dealer_hand} --> #{Blackjack.dealer_hand.sum}"
  end

  def evaluate
    puts "------------------------"
    self.status

    if Blackjack.player_hand.sum > Blackjack.dealer_hand.sum
      puts "You win this hand :)"
    elsif Blackjack.player_hand.sum < Blackjack.dealer_hand.sum
      puts "The dealer wins this hand :("
    else
      puts "This hand is a push :|"
    end

    self.new_hand_or_exit
  end

  # method for when the user goes over 21
  def player_bust
    puts "------------------------"
    self.status
    puts "The dealer wins this hand. You went over 21 and busted :("
    self.new_hand_or_exit
  end

  # method for when the dealer goes over 21
  def dealer_bust
    puts "------------------------"
    self.status
    puts "You win this hand. The dealer went over 21 and busted :)"
    self.new_hand_or_exit
  end

  # method for when the player has 21
  def player_winner_winner
    puts "------------------------"
    self.status
    puts "Winner winner, chicken dinner! You got 21 exactly :)"
    self.new_hand_or_exit
  end

  # method for when the dealer has 21
  def dealer_winner_winner
    puts "------------------------"
    self.status
    puts "The dealer got 21 exactly. You lose this hand :("
    self.new_hand_or_exit
  end

  # give user option to play another hand or quit
  def new_hand_or_exit
    puts "------------------------"
    print "Enter 'y' to play another hand or 'n' to exit: "
    input = gets.strip.upcase

    if input == "Y" # start another hand if user wants to keep playing
      Blackjack.discard
      self.deal_hand
    elsif input == "N" # allow user to exit
      self.exit
    else
      puts "* please enter either 'y' or 'n' *"
      self.start_menu # loop this method until user makes a valid choice
    end

  end

  # end the game
  def exit
    puts "------------------------"
    puts "Thanks for playing!"
  end

end

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

  def start_game
    API.get_new_deck # in order to play, we need a deck of cards first :)
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

  def player_hit
    Blackjack.player_draw
    puts "You drew a #{Blackjack.player_hand.last}"
    puts "Your cards are now the following: #{Blackjack.player_hand}"
    puts "The dealer still has: #{Blackjack.dealer_show_one} and another card that's face down"

    if Blackjack.player_over_21?
      self.player_bust
    elsif Blackjack.player_blackjack?
      self.player_winner_winner
    else
      self.play
    end

  end

  def stand
    # per convention, dealer must draw until their cards total 17 or over
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
  end

  def player_bust
    puts "------------------------"
    self.status
    puts "The dealer wins this hand. You went over 21 and busted :("
    # provide choice to run another hand or exit
  end

  def dealer_bust
    puts "------------------------"
    self.status
    puts "You win this hand. The dealer went over 21 and busted :)"
    # provide choice to run another hand or exit
  end

  def player_winner_winner
    puts "------------------------"
    self.status
    puts "Winner winner, chicken dinner! You got 21 exactly :)"
    # provide choice to run another hand or exit
  end

  def dealer_winner_winner
    puts "------------------------"
    self.status
    puts "The dealer got 21 exactly. You lose this hand :("
    # provide choice to run another hand or exit
  end

  # end the game
  def exit
    puts "------------------------"
    puts "Bye!"
  end

end

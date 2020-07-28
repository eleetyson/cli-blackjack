class CLI

  # greet the user
  def greeting
    puts "************************"
    puts "Welcome to CLI Blackjack"
    puts "************************"
    sleep(0.5)

    puts ""
    puts "Rules:"
    puts "1. Aces will show as 1."
    puts "2. Jacks, Queens, and Kings will show as 10."
    puts "3. If you stand, the dealer must draw until their hand totals 17 or over."
    puts "4. You'll be given $100 to start the game."
    puts "5. You must bet every hand."
    puts "6. A $1 bet is the minimum."
    puts "7. You can only bet in whole dollar amounts."
    puts ""
  end

  # give user option to play or exit the game
  def start_menu
    sleep(0.5)

    print "Enter 'y' to play or 'n' to exit: "
    input = gets.strip.upcase # standardize and store user's input

    if input == "Y" # start the game if user wants to play
      self.start_game
    elsif input == "N" # allow user to exit
      self.exit
    else
      sleep(0.5)
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
    sleep(0.5)

    puts ""
    puts "You have $#{Blackjack.player_winnings}."
    print "Please enter your bet for this hand: "
    input = gets.strip
    if input > Blackjack.player_winnings # input can't exceed amount user has
      "* you don't have enough to bet that much! *"
      self.deal_hand
    elsif input.to_i.is_a?(Integer) # only set their bet if given valid input
      Blackjack.set_bet(input.to_i)
    else # otherwise, this method loops until given valud input
      "* please enter an integer without special characters *"
      self.deal_hand
    end

    Blackjack.player_draw_two
    Blackjack.dealer_draw_two
    puts ""
    puts "........................"
    sleep(0.5)

    puts ""
    puts "Your cards are the following: #{Blackjack.player_hand}"
    puts "The dealer has: #{Blackjack.dealer_show_one} and [X]"
    # only play out hand if user doesn't have 21 already
    Blackjack.player_blackjack? ? self.player_winner_winner : self.play
  end

  # give user option to hit or stand
  def play
    sleep(0.5)

    print "Enter 'h' to hit or 's' to stand: "
    input = gets.strip.upcase

    if input == "H"
      self.player_hit
    elsif input == "S"
      self.stand
    else
      sleep(0.5)
      puts "* please enter either 'h' or 's' *"
      self.play # this method loops until given a valid input
    end

  end

  # draw a card for the user and display both hands
  def player_hit
    sleep(0.5)

    Blackjack.player_draw
    puts ""
    puts "........................"
    sleep(0.5)

    puts ""
    puts "You drew a #{Blackjack.player_hand.last}"
    puts "Your cards are now the following: #{Blackjack.player_hand} --> #{Blackjack.player_hand.sum}"
    puts "The dealer still has: #{Blackjack.dealer_show_one} and [X]"

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

  # display the user and dealer's hands
  def status
    sleep(0.5)

    puts ""
    puts "You: #{Blackjack.player_hand} --> #{Blackjack.player_hand.sum}"
    puts "Dealer: #{Blackjack.dealer_hand} --> #{Blackjack.dealer_hand.sum}"
  end

  # if nobody busts or hits 21, check who won
  def evaluate
    puts ""
    puts "........................"
    self.status

    if Blackjack.player_hand.sum > Blackjack.dealer_hand.sum
      sleep(0.5)
      puts "You win this hand :)"
    elsif Blackjack.player_hand.sum < Blackjack.dealer_hand.sum
      sleep(0.5)
      puts "The dealer wins this hand :("
    else
      sleep(0.5)
      puts "This hand is a push :|"
    end

    self.new_hand_or_exit
  end

  # method for when the user goes over 21
  def player_bust
    puts ""
    puts "........................"
    self.status

    puts "The dealer wins this hand. You went over 21 and busted :("
    self.new_hand_or_exit
  end

  # method for when the dealer goes over 21
  def dealer_bust
    puts ""
    puts "........................"
    self.status

    puts "You win this hand. The dealer went over 21 and busted :)"
    self.new_hand_or_exit
  end

  # method for when the player has 21
  def player_winner_winner
    puts ""
    puts "........................"
    self.status

    puts "Winner winner, chicken dinner! You got 21 exactly :)"
    self.new_hand_or_exit
  end

  # method for when the dealer has 21
  def dealer_winner_winner
    puts ""
    puts "........................"
    self.status

    puts "The dealer got 21 exactly. You lose this hand :("
    self.new_hand_or_exit
  end

  # give user option to play another hand or quit
  def new_hand_or_exit
    sleep(0.5)

    puts ""
    puts "........................"
    puts ""
    print "Enter 'y' to play another hand or 'n' to exit: "
    input = gets.strip.upcase

    if input == "Y" # start another hand if user wants to keep playing
      Blackjack.discard
      self.deal_hand
    elsif input == "N" # allow user to exit
      self.exit
    else
      sleep(0.5)
      puts "* please enter either 'y' or 'n' *"
      self.new_hand_or_exit # loop this method until user makes a valid choice
    end

  end

  # end the game
  def exit
    sleep(0.5)

    puts ""
    puts "........................"
    puts ""
    puts "Thanks for playing!"
    puts ""
  end

end

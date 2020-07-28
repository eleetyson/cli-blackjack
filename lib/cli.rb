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
    puts "6. Your bet must be a whole dollar amount."
    puts "7. Your bet cannot exceed what you currently have."
    puts ""
  end

  # give user option to play or exit the game
  def start_menu
    sleep(0.5)
    print "Enter 'y' to play or 'n' to exit: "
    input = gets.strip.upcase # standardize and store user's input

    # loop until user makes a valid choice
    if input == "Y" # start the game if user wants to play
      self.start_game
    elsif input == "N" # allow user to exit
      self.quit_game
    else
      sleep(0.5)
      puts "* please enter either 'y' or 'n' *"
      self.start_menu
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

    # loop #deal_hand until given valid user input
    if input.match?(/\D/)
      puts "* please enter an integer, omitting non-digit characters *"
      self.deal_hand
    elsif input.to_i == 0 || input.to_i == nil # input must be greater than 0
      puts "* please enter a integer greater than 0, omitting non-digit characters *"
      self.deal_hand
    elsif input.to_i > Blackjack.player_winnings # input can't exceed amount user has
      puts "* you don't have enough to bet that much! *"
      self.deal_hand
    else  # only set their bet if given valid input
      Blackjack.set_bet(input.to_i)
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
  end # #deal_hand end

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
      puts "* please enter either 'h' or 's' *"
      self.play # this method loops until given a valid input
    end

  end

  # draw a card for the user and display both hands
  def player_hit
    Blackjack.player_draw
    sleep(0.5)
    puts ""
    puts "........................"
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
  end # #player_hit end

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
  end # #stand end

  # display the user and dealer's hands
  def status
    sleep(0.5)
    puts ""
    puts "You: #{Blackjack.player_hand} --> #{Blackjack.player_hand.sum}"
    puts "Dealer: #{Blackjack.dealer_hand} --> #{Blackjack.dealer_hand.sum}"
  end

  # if nobody busts or hits 21, check who won
  def evaluate
    sleep(0.5)
    puts ""
    puts "........................"
    self.status

    # adjust totals
    if Blackjack.player_hand.sum > Blackjack.dealer_hand.sum
      sleep(0.5)
      puts "You win this hand and $#{Blackjack.bet} :)"
      Blackjack.add_player_winnings(Blackjack.bet)
    elsif Blackjack.player_hand.sum < Blackjack.dealer_hand.sum
      sleep(0.5)
      puts "The dealer wins this hand and you lose $#{Blackjack.bet} :("
      Blackjack.subtract_player_winnings(Blackjack.bet)
    else
      sleep(0.5)
      puts "This hand is a push :|"
    end

    if Blackjack.money_left? # user can only continue if they have money left
      self.new_hand_or_exit
    else
      puts ""
      puts "You ran out of money :("
      self.quit_game
    end
  end # #evaluate end

  # method for when the user goes over 21
  def player_bust
    sleep(0.5)
    puts ""
    puts "........................"
    self.status
    puts "The dealer wins this hand. You went over 21 and lose $#{Blackjack.bet} :("
    Blackjack.subtract_player_winnings(Blackjack.bet)

    if Blackjack.money_left? # user can only continue if they have money left
      self.new_hand_or_exit
    else
      puts ""
      puts "You ran out of money :("
      self.quit_game
    end
  end # #player_bust end

  # method for when the dealer goes over 21
  def dealer_bust
    sleep(0.5)
    puts ""
    puts "........................"
    self.status
    puts "You win this hand and $#{Blackjack.bet}. The dealer went over 21 :)"
    Blackjack.add_player_winnings(Blackjack.bet)
    self.new_hand_or_exit
  end

  # method for when the player has 21
  def player_winner_winner
    sleep(0.5)
    puts ""
    puts "........................"
    self.status

    puts "Winner winner, chicken dinner!"
    puts "You got 21 exactly and win $#{Blackjack.bet}"
    Blackjack.add_player_winnings(Blackjack.bet)
    self.new_hand_or_exit
  end

  # method for when the dealer has 21
  def dealer_winner_winner
    sleep(0.5)
    puts ""
    puts "........................"
    self.status

    puts "The dealer got 21 exactly. You lose this hand and $#{Blackjack.bet} :("
    Blackjack.subtract_player_winnings(Blackjack.bet)
    if Blackjack.money_left? # user can only continue if they have money left
      self.new_hand_or_exit
    else
      puts ""
      puts "You ran out of money :("
      self.quit_game
    end
  end # #dealer_winner_winner end

  # give user option to play another hand or quit
  def new_hand_or_exit
    sleep(0.5)
    puts ""
    puts "........................"
    puts ""

    # reset both hands and the user's bet
    Blackjack.discard
    Blackjack.set_bet(0)
    puts "You now have $#{Blackjack.player_winnings}"
    print "Enter 'y' to play another hand or 'n' to exit: "
    input = gets.strip.upcase

    if input == "Y" # start another hand if user wants to keep playing
      self.deal_hand
    elsif input == "N" # allow user to exit
      self.quit_game
    else
      puts "* please enter either 'y' or 'n' *"
      self.new_hand_or_exit # loop this method until user makes a valid choice
    end
  end # #new_hand_or_exit end

  # end the game
  def quit_game
    sleep(0.5)
    puts ""
    puts "........................"
    puts ""
    puts "Thanks for playing!"
    puts ""
    exit! # want to terminate the app any time #quit_game is invoked
  end

end

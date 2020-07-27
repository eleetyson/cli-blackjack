class CLI

  # greet the user
  def greeting
    puts "------------------------"
    puts "Welcome to CLI Blackjack"
    puts "------------------------"
    API.get_new_deck
  end

  # give user option to play or exit the game
  def start_menu
    print "Enter 'y' to play or 'n' to exit: "
    input = gets.strip.upcase # standardize and store user's input

    if input == "Y" # start the game if user wants to play
      self.play
    elsif input == "N" # allow user to exit
      self.exit
    else
      puts "* please enter either 'y' or 'n' *"
      self.start_menu # loop this method until user makes a valid choice
    end

  end

  def play
    API.get_new_deck # in order to play, we need a deck of cards first :)
    # draw two cards each for the player and dealer
    binding.pry
    Blackjack.player_draw
    Blackjack.player_draw
    Blackjack.dealer_draw
    Blackjack.dealer_draw
    puts "------------------------"
    puts "play functionality"
  end

  # end the game
  def exit
    puts "------------------------"
    puts "Bye!"
  end

end

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
    Blackjack.player_draw
    Blackjack.player_draw
    Blackjack.dealer_draw
    Blackjack.dealer_draw
    puts "------------------------"
    puts "Your cards are the following: #{Blackjack.player_hand}"
    puts "The dealer has: #{Blackjack.dealer_show_one} and another card that's face down"
    puts "Do you want to hit or stand?"
    binding.pry

  end

  # end the game
  def exit
    puts "------------------------"
    puts "Bye!"
  end

end

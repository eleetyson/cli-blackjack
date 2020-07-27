class CLI

  def greeting
    puts "------------------------"
    puts "Welcome to CLI Blackjack"
    puts "------------------------"
    API.get_new_deck
  end

  def start_menu
    print "Enter 'y' to play or 'n' to exit: "
    input = gets.strip.upcase

    if input == "Y"
      self.play
    elsif input == "N"
      self.exit
    else
      puts "* please enter either 'y' or 'n' *"
      self.start_menu
    end

  end

  def play
    
    puts "------------------------"
    puts "play functionality"
  end

  def exit
    puts "------------------------"
    puts "Bye!"
  end

end

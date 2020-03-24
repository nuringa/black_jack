module Message
  def wellcome_message
    puts 'Hello my friend, Lets play BlackJack'
    puts 'What\'s your name:'
  end

  def dealing_message
    puts 'Dealing cards, please wait.'
    sleep 1
  end

  def hand_status_message(player)
    puts "Cards in #{player.name}'s hand:"
  end

  def hand_points_message(player)
    puts "Total points: #{player.count_points}"
  end

  def choose_action_message
    puts "Decide what you'll do next:"
    puts '1. Take a new card'
    puts '2. Pass'
    puts '3. Show hands'
  end

  def wrong_input_message
    puts 'Sorry, you have made incorrect input'
  end
end

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
    puts "Total points: #{player.hand.hand_points}"
  end
end

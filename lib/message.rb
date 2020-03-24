module Message
  def wellcome_message
    puts 'Hello my friend, Lets play BlackJack'
    puts 'What\'s your name:'
  end

  def dealing_message
    puts 'Dealing cards, please wait.'
    sleep 1
  end

  def hand_status_message
    puts 'Cards in hand:'
  end
end

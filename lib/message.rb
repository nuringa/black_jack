module Message
  def welcome_message
    puts 'Hello my friend, Lets play BlackJack'
    puts 'What\'s your name:'
  end

  def dealing_message
    puts 'Dealing cards, please wait.'
    sleep 1
  end

  def bet_message(player)
    puts "#{player.name}, you have: #{player.bank}$ left in your bank."
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

  def game_over_message
    puts 'This game is over'
  end

  def draw_win_message
    puts 'Congratulations! You both win!'
  end

  def draw_lose_message
    puts 'Oops! You both lose!'
  end

  def win_message(player)
    puts "Congratulations #{player.name}! You have won!"
    puts "#{player.name}, you receive your $20 prize"
  end

  def lose_message(player)
    puts "Unlucky day, #{player.name}! You've lost!"
  end

  def bankrupt_message(player)
    puts "Sorry #{player.name}! You are a bankrupt!"
  end

  def another_game_message
    puts 'One more game?'
    puts '1. Yes  2. No'
  end

  def money_back_message
    puts 'Players get their 10$ back.'
  end

  def bank_total_message(players)
    puts "Player's total: $#{players[:human_player].bank}$. Dealer's total: $#{players[:dealer].bank}$"
  end
end

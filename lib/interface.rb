class Interface
  include Message

  def set_players
    welcome_message
    { human_player: Player.new(gets.chomp), dealer: Player.new }
  end

  def new_game
    game_bet
  end

  def hand_status(game_over, players)
    open_hand(players[:human_player])
    game_over ? open_hand(players[:dealer]) : hide_hand(players[:dealer])
  end

  def open_hand(player)
    hand_status_message(player)
    puts player.hand.map { |card| "#{card.rank}#{card.suite}" }.join(', ')
    hand_points_message(player)
  end

  def hide_hand(player)
    hand_status_message(player)
    puts '*** ' * player.hand.size
  end

  def player_choose_action
    choose_action_message
    gets.to_i
  end

  def another_game
    another_game_message
    gets.to_i
  end
end

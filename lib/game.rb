class Game

  attr_reader :players, :interface
  attr_accessor :deck

  def initialize
    @interface = Interface.new
    @players = @interface.set_players
    game_round
  end

  def game_round
    erase_data
    first_deal
    next_deal until @game_over
    game_result
    one_more_game
  end

  def first_deal
    game_bet
    interface.dealing_message
    2.times do
      deal_card(players[:human_player])
      deal_card(players[:dealer])
    end
    interface.hand_status(@game_over, players)
  end

  def game_bet
    @players.each_value do |player|
      if player.bankrupt?
        @game_over = true
        interface.bankrupt_message(player)
        exit
      else
        player.bet
        interface.bet_message(player)
      end
    end
  end

  def deal_card(player)
    card = @deck.cards.delete(@deck.cards.sample)
    player.add_card(card)
  end

  def next_deal
    player_turn(players[:human_player])
    dealer_turn(players[:dealer])
  end

  def player_turn(player)
    case interface.player_choose_action
    when 1
      deal_card(player)
      @game_over = true if player.full_hand? || player.max_points?
    when 2
      return
    when 3
      @game_over = true
    end
  end

  def dealer_turn(dealer)
    deal_card(dealer) if dealer.points < 17
    @game_over = true if dealer.full_hand?
  end

  def game_result
    interface.game_over_message
    interface.hand_status(@game_over, players)
    human_points = players[:human_player].points
    dealer_points = players[:dealer].points

    human_points != dealer_points ? win_check(human_points, dealer_points) : draw_check(human_points)
    interface.bank_total_message(players)
  end

  def draw_check(human_points)
    human_points == 21 ? interface.draw_win_message : interface.draw_lose_message
    players.each_value(&:money_back)
    interface.money_back_message
  end

  def win_check(human_points, dealer_points)

    if (human_points > dealer_points && human_points < 22) || dealer_points > 21
      reward_winner(players[:human_player])
   else
     reward_winner(players[:dealer])
    end
  end

  def reward_winner(player)
    interface.win_message(player)
    player.receive_prize
  end

  def one_more_game
    input = interface.another_game
    case input
    when 1
      game_round
    when 2
      exit
    else
      one_more_game
    end
  end

  def erase_data
    @deck = Deck.new
    @game_over = false
    players.each_value(&:erase_data)
    system 'clear'
  end
end

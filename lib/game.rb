class Game
  include Message

  attr_reader :players
  attr_accessor :deck

  def initialize(players)
    system('clear')
    @players = players
    @deck = Deck.new
    @game_over = false
    game_round
  end

  def game_round
    first_round if @deck.full?

    next_round until @game_over
    game_result
    bank_total_message(@players)
  end

  def hand_status
    @players.each do |_role, player|
      hand_status_message(player)
      puts player.hand.map { |card| "#{card.rank}#{card.suite}" }.join(', ')
      hand_points_message(player)
    end
  end

  def first_round
    game_bet
    dealing_message
    2.times do
      deal_card(players[:human_player])
      deal_card(players[:dealer])
    end
    hand_status
  end

  def game_bet
    @players.each_value do |player|
      if player.bankrupt?
        @game_over = true
        bankrupt_message(player)
        exit
      else
        player.bet
        bet_message(player)
      end
    end
  end

  def deal_card(player)
    card = @deck.cards.delete(@deck.cards.sample)
    player.add_card(card)
  end

  def next_round
    player_choose_action(players[:human_player])
    dealer_choose_action(players[:dealer])
  end

  def player_choose_action(player)
    choose_action_message
    choice = gets.to_i
    case choice
    when 1
      deal_card(player)
      @game_over = true if player.full_hand? || player.max_points?
    when 2
      return
    when 3
      @game_over = true
    end
  end

  def dealer_choose_action(dealer)
    deal_card(dealer) if dealer.points < 17
    @game_over = true if dealer.full_hand?
  end

  def game_result
    hand_status
    human_points = players[:human_player].points
    dealer_points = players[:dealer].points

    players.each_value(&:erase_data)

    human_points != dealer_points ? win_check(human_points, dealer_points) : draw_check(human_points)
  end

  def draw_check(human_points)
    human_points == 21 ? draw_win_message : draw_lose_message
    players.each_value(&:money_back)
    money_back_message
  end

  def win_check(human_points, dealer_points)

    if (human_points > dealer_points && human_points < 22) || dealer_points > 21
      win_message(players[:human_player])
      players[:human_player].receive_prize
    else
      win_message(players[:dealer])
      players[:dealer].receive_prize
    end
  end
end

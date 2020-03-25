class Game
  include Message

  attr_reader :players
  attr_accessor :deck

  def initialize(players)
    @players = players
    @deck = Deck.new
    @game_status = 0
    game_round
  end

  def game_round
    first_round if @deck.full?

    until @game_status == 1 do
      next_round
    end
    game_result
  end

  def hand_status
    @players.each do |_role, player|
      hand_status_message(player)
      puts player.hand.map { |card| "#{card.rank}#{card.suite}" }.join(', ')
      hand_points_message(player)
    end
  end

  def first_round
    dealing_message
    2.times do
      deal_card(players[:human_player])
      deal_card(players[:dealer])
    end
    game_bet
    hand_status
  end

  def game_bet
    @players.each_value do |player|
      if player.bankrupt?
        @game_status = 1
        bankrupt_message(player)
        return
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
      @game_status = 1 if player.full_hand? || player.max_points?
    when 2
      return
    when 3
      @game_status = 1
    end
  end

  def dealer_choose_action(dealer)
    deal_card(dealer) if dealer.points < 17
    @game_status = 1 if dealer.full_hand?
  end

  def game_result
    hand_status
    human_points = players[:human_player].points
    dealer_points = players[:dealer].points

    players.each_value do |player|
      player.points = 0
      player.hand = []
    end

    human_points != dealer_points ? win_check(human_points, dealer_points) : draw_check(human_points)
  end

  def draw_check(human_points)
    human_points == 21 ? draw_win_message : draw_lose_message
  end

  def win_check(human_points, dealer_points)

    if human_points > 21
      lose_message(players[:human_player])
    elsif human_points <= 21 && (human_points > dealer_points || dealer_points > 21)
      win_message(players[:human_player])
    else
      win_message(players[:dealer])
    end
  end
end

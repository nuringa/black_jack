class Game
  include Message

  attr_reader :players
  attr_accessor :deck

  def initialize
    # wellcome_message
    # name = gets.chomp
    # dealing_message
    @players = [User.new('name'), User.new]
    @deck = Deck.new
    game_flow
  end

  def game_flow
    game_round
    # check_round_result
  end

  def game_round
    first_round if @deck.full?
    next_round
    hand_status
  end

  def hand_status
    @players.each do |player|
      hand_status_message(player)
      puts player.hand.map { |card| "#{card.rank}#{card.suite}" }.join(', ')
      hand_points_message(player)
    end
  end

  def first_round
    @players.each do |player|
      deal_card(player)
      deal_card(player)
    end
    hand_status
  end

  def deal_card(player)
    card = @deck.cards.delete(@deck.cards.sample)
    player.add_card(card)
  end

  def next_round
    player_choose_action
    dealer_choose_action
    hand_status
  end

  def check_round_result
    # points = player.points
  end

  def player_choose_action
    choose_action_message
    choice = gets.to_i
    case choice
    when 1
      deal_card(@players[0])
    when 2
      return
    when 3
      game_result
    else
      wrong_input_message
    end
  end

  def dealer_choose_action
    if @players[1].points < 17
      deal_card(@players[1])
      p @deck.cards.count
    end
  end

  def game_result
    puts 'game result TODO'
  end
end

class Game
  include Message

  attr_reader :players
  attr_accessor :deck

  def initialize
    wellcome_message
    name = gets.chomp
    @players = [User.new(name), User.new]
    @deck = Deck.new
    game_flow
  end

  def game_flow
    game_round
  end

  def game_round
    dealing_message
    deal_cards
    deal_cards
    hand_status
  end

  def deal_cards
    @players.each do |player|
      card = @deck.deck.delete(@deck.deck.sample)
      player.hand.push(card)
    end
  end

  def hand_status
    @players.each do |player|
      hand_status_message
      puts player.hand.each(&:to_s)
    end
  end
end

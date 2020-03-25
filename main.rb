require_relative 'lib/message.rb'
require_relative 'lib/card.rb'
require_relative 'lib/deck.rb'
require_relative 'lib/game.rb'
require_relative 'lib/player.rb'

include Message

def one_more_game(players)
  another_game_message
  user_choice = gets.to_i
  if user_choice == 1
    Game.new(players)
  end
end

# wellcome_message
# name = gets.chomp
players = {human_player: Player.new('name'), dealer: Player.new}

Game.new(players)
user_choice = 0

until user_choice == 2 do
  one_more_game(players)
end


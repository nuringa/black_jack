require_relative 'lib/message.rb'
require_relative 'lib/card.rb'
require_relative 'lib/deck.rb'
require_relative 'lib/game.rb'
require_relative 'lib/player.rb'

include Message

welcome_message
players = { human_player: Player.new(gets.chomp), dealer: Player.new }
Game.new(players)

user_choice = 0
until user_choice == 2
  another_game_message
  user_choice = gets.to_i
  Game.new(players) if user_choice == 1
end

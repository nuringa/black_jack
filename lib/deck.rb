class Deck
  DECK = %w[2 3 4 5 6 7 8 9 10 Jack Queen King Ace].product(["\u{2665}",	"\u{2666}", "\u{2663}", "\u{2660}"]).freeze

  attr_reader :deck

  def initialize
    @deck = DECK.map { |card| Card.new(card[0], card[1]) }.shuffle
  end
end

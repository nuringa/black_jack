class Deck
  DECK = %i[2 3 4 5 6 7 8 9 10 Jack Queen King Ace].product(%i[hearts diamonds clubs spades]).freeze

  attr_reader :deck

  def initialize
    @deck = DECK.map { |card| Card.new(card[0], card[1]) }.shuffle
  end
end

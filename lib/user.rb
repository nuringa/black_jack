class User
  attr_reader :name
  attr_accessor :bank, :hand, :points

  POINTS = {
    '2' => 2, '3' => 3, '4' => 4, '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9,
    '10' => 10, 'Jack' => 10, 'Queen' => 10, 'King' => 10, 'Ace' => 11
  }.freeze

  def initialize(name = 'Dealer')
    @name = name
    @bank = 100
    @points = 0
    @hand = []
  end

  def add_card(card)
    hand << card
  end

  def dealer?
    name == 'Dealer'
  end

  def count_points
    @points = hand.sum { |card| POINTS[card.rank] }

    if hand.detect { |card| card.ace? } && points > 21
      @points -= 10
    else
      @points
    end
  end
end
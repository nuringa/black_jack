class Hand
  attr_accessor :cards, :points

  POINTS = {
      '2' => 2, '3' => 3, '4' => 4, '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9,
      '10' => 10, 'Jack' => 10, 'Queen' => 10, 'King' => 10, 'Ace' => 11
  }.freeze

  def initialize
    @cards = []
    @points = 0
  end

  def full_hand?
    cards.size == 3
  end

  def max_points?
    points == 21
  end

  def count_points
    @points = cards.sum { |card| POINTS[card.rank] }

    if cards.detect(&:ace?) && points > 21
      @points -= 10
    else
      @points
    end
  end
end

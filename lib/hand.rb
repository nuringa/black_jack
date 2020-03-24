class Hand
  attr_accessor :cards, :points

  POINTS = {
      "2"=>2, "3"=>3, "4"=>4, "5"=>5, "6"=>6, "7"=>7, "8"=>8, "9"=>9,
      "10"=>10, "Jack"=>10, "Queen"=>10, "King"=>10, "Ace"=>11
  }

  def initialize
    @points = 0
    @cards = []
  end

  def hand_points
    points = cards.sum { |card| POINTS[card.rank] }

    if cards.detect { |card| card.ace? } && points > 21
      self.points -= 10
    else
      points
    end
  end
end

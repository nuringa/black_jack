class Player
  include Message

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

  def bet
    self.bank -= 10
  end

  def bankrupt?
    bank <= 0
  end

  def full_hand?
    hand.size == 3
  end

  def max_points?
    points == 21
  end

  def count_points
    @points = hand.sum { |card| POINTS[card.rank] }

    if hand.detect(&:ace?) && points > 21
      @points -= 10
    else
      @points
    end
  end

  def erase_data
    self.points = 0
    self.hand = []
  end

  def money_back
    self.bank += 10
  end

  def receive_prize
    receive_prize_message(self)
    self.bank += 20
  end
end

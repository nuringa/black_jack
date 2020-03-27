class Player

  attr_reader :name
  attr_accessor :bank, :hand

  def initialize(name = 'Dealer')
    @name = name
    @bank = 100
    new_hand
  end

  def new_hand
    @hand = Hand.new
  end

  def add_card(card)
    hand.cards << card
  end

  def bet
    self.bank -= 10
  end

  def bankrupt?
    bank <= 0
  end

  def money_back
    self.bank += 10
  end

  def receive_prize
    self.bank += 20
  end
end

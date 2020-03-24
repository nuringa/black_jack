class User
  attr_reader :name
  attr_accessor :bank, :hand, :points

  def initialize(name = 'Dealer')
    @name = name
    @bank = 100
    @hand = []
    @points = 0
  end

  def dealer?
    name == 'Dealer'
  end
end
class Card
  attr_reader :suite, :rank

  def initialize(rank, suite)
    @rank = rank
    @suite = suite
  end
end
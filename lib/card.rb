class Card
  attr_reader :suite, :rank

  def initialize(rank, suite)
    @rank = rank
    @suite = suite
  end

  def ace?
    rank == 'Ace'
  end

  # def to_s
  #   "#{rank}#{suite}"
  # end
end

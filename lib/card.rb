class Card
  attr_reader :suite, :rank

  def initialize(rank, suite)
    @rank = rank
    @suite = suite
  end

  def to_s
    "#{rank} of #{suite}"
  end
end

class Roll
  attr_reader :dice
  attr_accessor :scores

  def initialize(dice)
    @dice = dice
    @scores = []
  end

  def score
    dice.uniq.each do |die|
      scores << die_score(die)
    end

    scores.inject(:+).to_i
  end

  private
  
  def die_score(die)
    score_table[die][dice.count(die)]
  end

  def score_table
    {
      1 => [0, 100, 200, 1000, 1100, 1200],
      2 => [0, 0, 0, 200, 200, 200],
      3 => [0, 0, 0, 300, 300, 300],
      4 => [0, 0, 0, 400, 400, 400],
      5 => [0, 50, 100, 500, 550, 600],
      6 => [0, 0, 0, 600, 600, 600],
    }
  end
end

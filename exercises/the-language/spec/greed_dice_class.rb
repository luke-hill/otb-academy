class GreedCalculator
  attr_reader :dice

  def initialize(dice)
    @dice = dice
  end

  def score
    one_score + five_score + other_score
  end

  private

  def one_score
    if count(1) >= 3
      1000 + (100 * (count(1) - 3))
    else
      100 * count(1)
    end
  end

  def five_score
    if count(5) >= 3
      500 + (50 * (count(5) - 3))
    else
      50 * count(5)
    end
  end

  def other_score
    [2, 3, 4, 6].inject(0) do |sum, value|
      sum + (100 * value) if count(value) >= 3
      sum
    end
  end

  def count(value)
    dice.count(value)
  end
end
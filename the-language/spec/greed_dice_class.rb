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
      500 + (50 * (count(1) - 3))
    else
      50 * count(5)
    end
  end

  def other_score
    if count(2) >= 3
      200
    elsif count(3) >= 3
      300
    elsif count(4) >= 3
      400
    elsif count(6) >= 3
      600
    else
      0
    end
  end

  def count(value)
    if sorted[value]
      sorted[value].length
    else
      0
    end
  end

  def sorted
    dice.group_by { |x| x }
  end
end
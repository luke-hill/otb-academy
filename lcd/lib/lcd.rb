class LCD
  attr_reader :input

  def initialize(input)
    @input = input
  end

  def render
    "#{render_line_one}\n#{render_line_two}\n#{render_line_three}\n"
  end

  private

  def render_line_one
    ans = ''
    number_as_digits.each do |digit|
      ans << line_one(digit)
    end
    ans
  end

  def render_line_two
    ans = ''
    number_as_digits.each do |digit|
      ans << line_two(digit)
    end
    ans
  end

  def render_line_three
    ans = ''
    number_as_digits.each do |digit|
      ans << line_three(digit)
    end
    ans
  end

  def number_as_digits
    input.digits.reverse
  end

  def line_one(digit)
    " #{underscore(digit, 0)} "
  end

  def line_two(digit)
    "#{pipe(digit, 1)}#{underscore(digit, 2)}#{pipe(digit, 3)}"
  end

  def line_three(digit)
    "#{pipe(digit, 4)}#{underscore(digit, 5)}#{pipe(digit, 6)}"
  end

  def underscore(digit, position)
    if write_character?(digit, position)
      '_'
    else
      ' '
    end
  end

  def pipe(digit, position)
    if write_character?(digit, position)
      '|'
    else
      ' '
    end
  end

  def write_character?(digit, position)
    number_lcd_table[digit].include?(position)
  end

  def number_lcd_table #Top,Mid-Left,Mid,Mid-Right,Bot-Left,Bot,Bot-Right
    {
      1 => [3, 6],
      2 => [0, 2, 3, 4, 5],
      3 => [0, 2, 3, 5, 6],
      4 => [1, 2, 3, 6],
      5 => [0, 1, 2, 5, 6],
      6 => [0, 1, 2, 4, 5, 6],
      7 => [0, 3, 6],
      8 => [0, 1, 2, 3, 4, 5, 6],
      9 => [0, 1, 2, 3, 5, 6],
    }
  end
end

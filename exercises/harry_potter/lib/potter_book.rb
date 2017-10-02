class PotterBook
  attr_reader :books

  def initialize(books)
    @books = books
  end

  def sell
    starting_cost = 0
    repeated_bucketing.each do |bucket|
      starting_cost += sell_one_bucket(bucket.length)
    end
    starting_cost
  end

  private

  def repeated_bucketing(input = books, answer = [])
    cleaned, duplicates = split_into_two_buckets(input)
    answer << cleaned

    unless duplicates.empty?
      repeated_bucketing(duplicates, answer)
    end
    answer
  end

  def split_into_two_buckets(input)
    uniques = input.uniq

    uniques.each do |value|
      input.delete_at(input.index(value))
    end
    [uniques, input]
  end

  def sell_one_bucket(bucket)
    case bucket
      when 1
        8
      when 2
        15.2
      when 3
        21.6
      when 4
        25.6
      else
        30
    end
  end
end

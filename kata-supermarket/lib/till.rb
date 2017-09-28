require_relative 'rules'
require_relative 'prices'

class Till
  attr_reader :items
  attr_accessor :receipt
  include Rules
  include Prices
  
  def initialize(items)
    @items = items
    @receipt = ''
  end
  
  def basket
    @basket ||= items.each_with_object(Hash.new(0)) { |item, amount| amount[item] += 1 }
  end
  
  def sell_basket
    basket.keys.inject(0) do |sum, item|
      sum + sell(item)
    end
  end
  
  def sell(item)
    if three_for_two?(item)
      three_for_two_cost(item)
    else
      regular_cost(item)
    end
  end
  
  def amount(item)
    basket.fetch(item, "Could not find '#{item}' in basket!")
  end
  
  def three_for_two_cost(item)
    number_free = amount(item) / 3
    (amount(item) - number_free) * price(item)
  end
  
  def regular_cost(item)
    amount(item) * price(item)
  end
  
  private

  def three_for_two?(item)
    three_for_two.include?(snake_cased_item(item))
  end

  def snake_cased_item(item)
    item.downcase.gsub(' ', '_').to_sym
  end
  
  def price(item)
    prices.fetch(snake_cased_item(item))
  end
end

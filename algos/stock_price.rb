class StockPrice
  attr_reader :prices

  def initialize(prices)
    @prices = prices
  end

  def max_profit_one_sale
    max_from_single_run(prices)[:max_profit]
  end

  def max_profit_two_sales
    first_run = max_from_single_run(prices)

    left_max = max_from_single_run(prices[0..first_run[:min_idx]])
    right_max = max_from_single_run(prices[first_run[:max_profit_idx]..-1])

    biggest = if left_max[:max_profit] > right_max[:max_profit]
                left_max
              else
                right_max
              end

    return first_run[:max_profit] + biggest[:max_profit]
  end

  def max_from_single_run(prices)
    min = prices.first
    min_idx = 0
    max_profit = 0
    max_profit_idx = nil

    prices[1..-1].each_with_index do |n, i|
      if n < min
        min = n
        min_idx = 0
      end

      if (n - min) > max_profit
        max_profit = (n - min)
        max_profit_idx = i
      end
    end

    { max_profit: max_profit, max_profit_idx: max_profit_idx, min_idx: min_idx }
  end
end

puts StockPrice.new([310, 315, 275, 295, 260, 270, 290, 230, 255, 250]).max_profit_one_sale
puts StockPrice.new([12, 11, 13, 9, 12, 8, 14, 13, 15]).max_profit_two_sales


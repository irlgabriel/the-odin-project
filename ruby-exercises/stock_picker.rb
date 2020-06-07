def stock_picker(array) 
  max_profit = 0
  best_buy_day = 0
  best_sell_day = 0
  array.each_with_index do |val1, buy_day|
    array[buy_day...array.length].each_with_index do |val2, sell_day| 
      if val2 - val1 > max_profit 
        max_profit = val2 - val1
        best_buy_day = buy_day
        best_sell_day = buy_day + sell_day
      end
    end
  end
  [best_buy_day, best_sell_day]
end

p stock_picker([17,3,6,9,15,8,6,1,10])
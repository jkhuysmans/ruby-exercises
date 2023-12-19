def stock_picker(numbers)

    while numbers.last == numbers.min
        numbers.pop
    end
    while numbers.first == numbers.max
        numbers.shift
    end

    buy_and_sell = []    
    buy_and_sell.push numbers.min
    buy_day = numbers.index(numbers.min) 

    numbers_after_buy = numbers[buy_day..-1]
    buy_and_sell.push numbers_after_buy.max

    p buy_and_sell
end

numbers = []
10.times do
    numbers << rand(1..30)
  end
p numbers

stock_picker(numbers)
def total(prices)
  # given an array of prices
  # add them all together and return the total

  prices.reduce(:+)
end

def refund(prices)
  # given an array of prices
  # subtract each price from the customer's account balance.

  return (0 - total(prices))
end

def show_discounts(prices)
  # given an array of prices
  # reduce each item's price by 1.3 and print the savings.
  prices.each do |price|
    amount_off = price / 3.0
    puts format("Your discount: $%.2f", amount_off)
  end
end

prices = [3.99, 25.00, 8.99]

puts format("%.2f", total(prices))
puts format("%.2f", refund(prices))
show_discounts(prices)
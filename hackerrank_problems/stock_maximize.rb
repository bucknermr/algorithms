# https://www.hackerrank.com/challenges/stockmax/problem

#!/bin/ruby

def stockmax(prices)
  # Complete this function
  store = {}
  stockmax_util(prices, store)
end

def stockmax_util(prices, store, idx = 0, owned_shares = 0, profit = 0)
  return profit if idx == prices.length


  buy = profit - prices[idx]
  sell = profit + (prices[idx] * owned_shares)

  a = stockmax_util(prices, store, idx + 1, owned_shares + 1, buy)
  b = stockmax_util(prices, store, idx + 1, 0, sell)
  c = stockmax_util(prices, store, idx + 1, owned_shares, profit)

  [a, b, c].max
end

t = gets.strip.to_i
for a0 in (0..t-1)
  n = gets.strip.to_i
  prices = gets.strip
  prices = prices.split(' ').map(&:to_i)
  result = stockmax(prices)
  puts result
end

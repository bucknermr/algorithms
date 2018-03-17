# https://www.hackerrank.com/challenges/between-two-sets/problem

#!/bin/ruby

def getTotalX(a, b)
    # Complete this function
end

n, m = gets.strip.split(' ')
n = n.to_i
m = m.to_i
a = gets.strip
a = a.split(' ').map(&:to_i)
b = gets.strip
b = b.split(' ').map(&:to_i)
total = getTotalX(a, b)
puts total

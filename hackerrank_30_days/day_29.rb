# https://www.hackerrank.com/challenges/30-bitwise-and/problem

#!/bin/ruby

def method(n, k)
  max = -1.0 / 0
  (1...n).each do |x|
    (x + 1..n).each do |y|
      z = x & y
      max = z if z < k && z > max
    end
  end
  max
end

t = gets.strip.to_i
for a0 in (0..t-1)
  n,k = gets.strip.split(' ')
  n = n.to_i
  k = k.to_i
  puts method(n, k)
end

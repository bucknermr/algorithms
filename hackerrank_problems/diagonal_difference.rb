# https://www.hackerrank.com/challenges/diagonal-difference/problem

#!/bin/ruby

def diagonalDifference(a)
    # Complete this function
end

n = gets.strip.to_i
a = Array.new(n)
for a_i in (0..n-1)
    a_t = gets.strip
    a[a_i] = a_t.split(' ').map(&:to_i)
end
result = diagonalDifference(a)
puts result

# https://www.hackerrank.com/challenges/a-very-big-sum/problem

#!/bin/ruby

def aVeryBigSum(n, ar)
    # Complete this function
    ar.inject(&:+)
end

n = gets.strip.to_i
ar = gets.strip
ar = ar.split(' ').map(&:to_i)
result = aVeryBigSum(n, ar)
puts result;

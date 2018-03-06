# https://www.hackerrank.com/challenges/kangaroo/problem

#!/bin/ruby

def kangaroo(x1, v1, x2, v2)
    # Complete this function
    return "NO" if (x1 > x2 && v1 > v2) || (x2 > x1 && v2 > v1)

    difference = (x1 - x2).abs
    change = (v1 - v2).abs

    return "NO" if change === 0 && difference > 0
    difference % change === 0 ? "YES" : "NO"
end

x1, v1, x2, v2 = gets.strip.split(' ')
x1 = x1.to_i
v1 = v1.to_i
x2 = x2.to_i
v2 = v2.to_i
result = kangaroo(x1, v1, x2, v2)
puts result;

# https://www.hackerrank.com/challenges/30-recursion/problem

#!/bin/ruby

def factorial(n)
    # Complete this function
    return 1 if n <= 1
    n * factorial(n - 1)
end

n = gets.strip.to_i
result = factorial(n)
puts result

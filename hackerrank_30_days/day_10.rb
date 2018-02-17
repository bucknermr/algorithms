# https://www.hackerrank.com/challenges/30-binary-numbers/problem

#!/bin/ruby

n = gets.strip.to_i

result = ""
counter = 0
max = 0

while n > 0
    result += (n % 2).to_s
    if result[-1] == '1'
        counter += 1
        max = counter > max ? counter : max
    else
        counter = 0
    end

    n = n / 2
end

puts max

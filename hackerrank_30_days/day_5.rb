# https://www.hackerrank.com/challenges/30-loops/problem

#!/bin/ruby

n = gets.strip.to_i

(1..10).each do |i|
    puts "#{n} x #{i} = #{n * i}"
end

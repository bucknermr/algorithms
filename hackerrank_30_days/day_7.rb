# https://www.hackerrank.com/challenges/30-arrays/problem

#!/bin/ruby

n = gets.strip.to_i
arr = gets.strip
arr = arr.split(' ').map(&:to_i)

puts arr.reverse.join(' ');

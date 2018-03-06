# https://www.hackerrank.com/challenges/ctci-making-anagrams/problem

#!/bin/ruby

def steps_to_anagram(a, b)
  steps = 0
  a_count = Hash.new(0)
  a.each_char { |ch| a_count[ch] += 1 }

  b.each_char do |ch|
    if a_count[ch] > 0
      a_count[ch] -=1
    else
      steps += 1
    end
  end

  steps + a_count.values.reduce(0) { |acc, n| acc + n }
end

a = gets.strip
b = gets.strip

puts steps_to_anagram(a, b)

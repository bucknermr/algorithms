# https://www.hackerrank.com/challenges/apple-and-orange/problem

#!/bin/ruby

def countApplesAndOranges(s, t, a, b, apples, oranges)
    # Complete this function
    
end

s, t = gets.strip.split(' ')
s = s.to_i
t = t.to_i
a, b = gets.strip.split(' ')
a = a.to_i
b = b.to_i
m, n = gets.strip.split(' ')
m = m.to_i
n = n.to_i
apple = gets.strip
apple = apple.split(' ').map(&:to_i)
orange = gets.strip
orange = orange.split(' ').map(&:to_i)
countApplesAndOranges(s, t, a, b, apple, orange)

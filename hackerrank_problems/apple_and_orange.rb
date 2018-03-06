# https://www.hackerrank.com/challenges/apple-and-orange/problem

#!/bin/ruby

def countApplesAndOranges(s, t, a, b, apples, oranges)
    # Complete this function
    puts apples.reduce(0) { |acc, dist| acc + ((a + dist).between?(s, t) ? 1 : 0) }
    puts oranges.reduce(0) { |acc, dist| acc + ((b + dist).between?(s, t) ? 1 : 0) }
end

# def countApplesAndOranges(s, t, a, b, apples, oranges)
#     # Complete this function
#     result = [0, 0]
#     apples.each do |dist|
#       result[0] += 1 if hit?(s, t, a, dist)
#     end
#     oranges.each do |dist|
#       result[1] += 1 if hit?(s, t, b, dist)
#     end
#
#     puts result.join(' ')
# end
#
# def hit?(s, t, start, dist)
#   (start + dist).between?(s, t)
# end

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

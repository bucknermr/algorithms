# https://www.hackerrank.com/challenges/ctci-array-left-rotation/problem

#!/bin/ruby

def left_rotation(arr, n)
    arr[n % arr.length..-1] + arr[0...n % arr.length]
end

n,k = gets.strip.split(' ')
n = n.to_i
k = k.to_i
a = gets.strip
a = a.split(' ').map(&:to_i)

puts left_rotation(a, k).join(' ')

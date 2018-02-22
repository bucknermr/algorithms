# https://www.hackerrank.com/challenges/30-2d-arrays/problem

#!/bin/ruby

arr = Array.new(6)
for arr_i in (0..6-1)
    arr_t = gets.strip
    arr[arr_i] = arr_t.split(' ').map(&:to_i)
end

max = -1.0 / 0.0

(arr.length - 2).times do |i|
    (arr[i].length - 2).times do |j|
        sum = 0
        sum += arr[i][j..j + 2].inject(0, :+)
        sum += arr[i + 1][j + 1]
        sum += arr[i + 2][j..j + 2].inject(0, :+)
        max = sum > max ? sum : max
    end
end

puts max

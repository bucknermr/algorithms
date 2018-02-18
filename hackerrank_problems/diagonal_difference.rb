# https://www.hackerrank.com/challenges/diagonal-difference/problem

#!/bin/ruby

def diagonalDifference(a)
    # Complete this function
    diag_1 = 0
    diag_2 = 0
    n = a.length
    n.times do |i|
        diag_1 += a[i][i]
        diag_2 += a[i][n - 1 - i]
    end

    (diag_1 - diag_2).abs
end

n = gets.strip.to_i
a = Array.new(n)
for a_i in (0..n-1)
    a_t = gets.strip
    a[a_i] = a_t.split(' ').map(&:to_i)
end
result = diagonalDifference(a)
puts result

# https://www.hackerrank.com/challenges/plus-minus/problem

#!/bin/ruby

def plusMinus(arr)
    # Complete this function
    pos_count = 0
    neg_count = 0
    zero_count = 0

    arr.each do |num|
        if num < 0
            neg_count += 1
        elsif num > 0
            pos_count += 1
        else
            zero_count += 1
        end
    end

    puts (pos_count.fdiv arr.length).round(6)
    puts (neg_count.fdiv arr.length).round(6)
    puts (zero_count.fdiv arr.length).round(6)
end

n = gets.strip.to_i
arr = gets.strip
arr = arr.split(' ').map(&:to_i)
plusMinus(arr)

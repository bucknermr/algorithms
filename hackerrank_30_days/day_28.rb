# https://www.hackerrank.com/challenges/30-regex-patterns/problem

#!/bin/ruby

def gmail?(email)
  email.match? /^[A-Za-z0-9._%+-]+@gmail.com$/
end

def quicksort(arr, &blk)
  blk ||= Proc.new { |x, y| x <=> y }
  quicksort_util(arr, &blk)
end

def quicksort_util(arr, start_idx = 0, end_idx = arr.length - 1, &blk)
  return arr if start_idx >= end_idx

  barrier = start_idx
  pivot = arr[start_idx]

  (start_idx + 1..end_idx).each do |i|
    if blk.call(pivot, arr[i]) == 1
      barrier += 1
      swap_elements(arr, barrier, i)
    end
  end

  swap_elements(arr, start_idx, barrier)

  quicksort_util(arr, start_idx, barrier - 1, &blk)
  quicksort_util(arr, barrier + 1, end_idx, &blk)

  arr
end

def swap_elements(arr, i, j)
  arr[i], arr[j] = arr[j], arr[i]
end

N = gets.strip.to_i

names = []

for a0 in (0..N-1)
  firstName,emailID = gets.strip.split(' ')
  names << firstName if gmail?(emailID)
end

puts quicksort(names) { |x, y| x.downcase <=> y.downcase }

# https://www.hackerrank.com/challenges/30-sorting/problem

#!/bin/ruby

n = gets.strip.to_i
a = gets.strip
a = a.split(' ').map(&:to_i)
# Write Your Code Here

def bubble_sort(arr)
  num_swaps = 0
  sorted = false

  until sorted
    sorted = true
    i = 0

    while i < arr.length - 1
      if arr[i] > arr[i + 1]
        swap(i, i + 1, arr)
        num_swaps += 1
        sorted = false
      end

      i += 1
    end
  end

  { array: arr, num_swaps: num_swaps }
end

def swap(i, j, arr)
  arr[i], arr[j] = arr[j], arr[i]
end

result = bubble_sort(a)

puts "Array is sorted in #{result[:num_swaps]} swaps."
puts "First Element: #{result[:array].first}"
puts "Last Element: #{result[:array].last}"

def highest_product_of_3(int_array)
  sorted = int_array.sort
  [
    sorted[-3..-1].reduce(:*),
    sorted[0..1].reduce(:*) * sorted[-1],
  ].max
end

# run your function through some test cases here
# remember: debugging is half the battle!


# [3, 4, 2, 6, 100, 0, 1] => 4 * 6 * 100 === 2400
puts highest_product_of_3([3, 4, 2, 6, 100, 0, 1]) === 2400

# [-10, -5, 3, 4, 2, 1, 8] => -10 * -5 * 8 === 400
puts highest_product_of_3([-10, -5, 3, 4, 2, 1, 8]) === 400

# [-299, -4, -1, -12, -3, -5] => -4 * -1 * -3 === -12
puts highest_product_of_3([-299, -4, -1, -12, -3, -5]) === -12

# [-299, -4, -1, -12, -3, -5, 0] => -1 * -3 * 0 === 0
puts highest_product_of_3([-299, -4, -1, -12, -3, -5, 0]) === 0


# METHOD 1:
# Sort array: O(nlog(n))
# Check possibilities: O(1)
  # 3 largest
  # largest * 2 smallest

# METHOD 2:
# use heaps, keep track of top 3

def highest_product_of_3(int_array)
  first_2 = int_array.take(2)
  highest = first_2.max
  lowest = first_2.min

  highest_product_of_2 = first_2.reduce(:*)
  lowest_product_of_2 = highest_product_of_2
  current_highest = highest_product_of_2 * int_array[2]

  int_array.drop(2).each do |int|

    current_highest = [
      current_highest,
      lowest_product_of_2 * int,
      highest_product_of_2 * int
    ].max


    highest_product_of_2 = [
      highest_product_of_2,
      highest * int,
      lowest * int
    ].max

    lowest_product_of_2 = [
      lowest_product_of_2,
      lowest * int,
      highest * int
    ].min

    highest = int if int > highest
    lowest = int if int < lowest
  end

  current_highest
end

# [3, 4, 2, 6, 100, 0, 1] => 4 * 6 * 100 === 2400
puts highest_product_of_3([3, 4, 2, 6, 100, 0, 1]) == 2400

# [-10, -5, 3, 4, 2, 1, 8] => -10 * -5 * 8 === 400
puts highest_product_of_3([-10, -5, 3, 4, 2, 1, 8]) == 400

# [-299, -4, -1, -12, -3, -5] => -4 * -1 * -3 === -12
puts highest_product_of_3([-299, -4, -1, -12, -3, -5]) == -12

# [-299, -4, -1, -12, -3, -5, 0] => -1 * -3 * 0 === 0
puts highest_product_of_3([-299, -4, -1, -12, -3, -5, 0]) == 0

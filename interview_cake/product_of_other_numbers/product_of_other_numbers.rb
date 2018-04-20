# Greedy solution:
def products_excluding_index(int_array)
  raise ArgumentError, "Need at least 2 integers" if int_array.length < 2

  products = []
  product_so_far = 1

  int_array.each do |el|
    products << product_so_far
    product_so_far *= el
  end

  product_so_far = 1

  (int_array.length - 1).downto(0) do |i|
    products[i] *= product_so_far
    product_so_far *= int_array[i]
  end
  products
end

def products_excluding_index_division(int_array)
  raise ArgumentError, "Need at least 2 integers" if int_array.length < 2

  products = Array.new(int_array.length, 0)
  zero_idx = nil
  total_product = 1

  int_array.each_with_index do |el, i|
    if el.zero?
      return products if zero_idx
      zero_idx = i
    else
      total_product *= el
    end
  end

  if zero_idx
    products[zero_idx] = total_product
  else
    int_array.each_with_index { |el, i| products[i] = total_product / el }
  end

  products
end

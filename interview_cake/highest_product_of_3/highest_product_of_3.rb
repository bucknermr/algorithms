# def highest_product_of_3(int_array)
#   sorted = int_array.sort
#   [
#     sorted[-3..-1].reduce(:*),
#     sorted[0..1].reduce(:*) * sorted[-1],
#   ].max
# end

def highest_product_of_3(int_array)
  min_heap = BinaryHeap.new { |x, y| x <=> y }
  max_heap = BinaryHeap.new { |x, y| y <=> x }

  3.times do |i|
    min_heap.add(int_array[i])
    max_heap.add(int_array[i])
    max_heap.extract if i == 2
  end

  int_array.drop(3).each do |el|
    if el > min_heap.peek
      min_heap.add(el)
      min_heap.extract
    end
    if el < max_heap.peek
      max_heap.add(el)
      max_heap.extract
    end
  end

  a = min_heap.inject(:*)
  2.times { min_heap.extract }
  b = max_heap.inject(:*) * min_heap.first

  [a, b].max
end

class BinaryHeap
  include Enumerable

  attr_reader :store

  def initialize(&prc)
    @prc = prc || Proc.new { |x, y| x <=> y }
    @store = []
  end

  def length
    @store.length
  end

  def peek
    @store.first
  end

  def extract
    top = @store.first
    @store[0] = @store[-1]
    @store.pop
    heapify_down(0)
    top
  end

  def add(el)
    @store << el
    heapify_up(length - 1)
  end

  def heapify_down(idx)
    BinaryHeap.heapify_down(@store, idx, @prc)
  end

  def heapify_up(idx)
    BinaryHeap.heapify_up(@store, idx, @prc)
  end

  def self.heapify_down(store, idx, prc)
    current_el = store[idx]
    child_indices = BinaryHeap.child_indices(idx, store.length)
    return store if store.empty?

    children = child_indices.map { |i| store[i] }

    if children.any? { |child| prc.call(current_el, child) == 1 }
      swap_idx = children.length > 1 && prc.call(*children) == 1 ? child_indices[1] : child_indices[0]
      store[idx], store[swap_idx] = store[swap_idx], store[idx]
      BinaryHeap.heapify_down(store, swap_idx, prc)
    end

    store
  end

  def self.heapify_up(store, idx, prc)
    return store if idx == 0
    parent_index = BinaryHeap.parent_index(idx)
    if prc.call(store[parent_index], store[idx]) == 1
      store[idx], store[parent_index] = store[parent_index], store[idx]
      BinaryHeap.heapify_up(store, parent_index, prc)
    end

    store
  end

  def each(&blk)
    @store.each(&blk)
  end

  def to_s
    @store
  end

  def inspect
    to_s
  end

  def self.child_indices(idx, len)
    [(idx * 2) + 1, (idx * 2) + 2].select { |i| i < len }
  end

  def self.parent_index(idx)
    (idx - 1) / 2
  end

end


# [3, 4, 2, 6, 100, 0, 1] => 4 * 6 * 100 === 2400
puts highest_product_of_3([3, 4, 2, 6, 100, 0, 1]) == 2400

# [-10, -5, 3, 4, 2, 1, 8] => -10 * -5 * 8 === 400
puts highest_product_of_3([-10, -5, 3, 4, 2, 1, 8]) == 400

# [-299, -4, -1, -12, -3, -5] => -4 * -1 * -3 === -12
puts highest_product_of_3([-299, -4, -1, -12, -3, -5]) == -12

# [-299, -4, -1, -12, -3, -5, 0] => -1 * -3 * 0 === 0
puts highest_product_of_3([-299, -4, -1, -12, -3, -5, 0]) == 0


# METHOD 1:
# Sort array: O(nlog(n))
# Check possibilities: O(1)
  # 3 largest
  # largest * 2 smallest

# METHOD 2:
# use heaps, keep track of top 3

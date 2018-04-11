class BinaryHeap
  def initialize(&prc)
    @prc = prc || Proc.new { |x, y| x <=> y }
    @store = []
  end

  def peak
    @store[0]
  end

  def insert(val)
    @store << val
    idx = @store.length - 1
    BinaryHeap.heapify_up(@store, idx, &@prc)
    val
  end

  def extract
    @store[0], @store[-1] = @store[-1], @store[0]
    val = @store.pop
    BinaryHeap.heapify_down(@store, 0, &@prc)
    val
  end

  def length
    @store.length
  end

  def self.heapify_up(array, idx, &prc)
    prc ||= BinaryHeap.default_proc
    parent_idx = BinaryHeap.parent_index(idx)

    return true unless parent_idx && prc.call(array[parent_idx], array[idx]) == 1

    array[parent_idx], array[idx] = array[idx], array[parent_idx]
    BinaryHeap.heapify_up(array, parent_idx, &prc)
  end

  def self.heapify_down(array, parent_idx, length = array.length, &prc)
    prc ||= BinaryHeap.default_proc
    child_indices = BinaryHeap.child_indices(parent_idx, length)
    return true if child_indices.empty?

    swap_idx = child_indices.first
    if child_indices.length == 2
      i, j = child_indices
      swap_idx = prc.call(array[i], array[j]) == 1 ? j : i
    end

    return true if prc.call(array[parent_idx], array[swap_idx]) <= 0

    array[swap_idx], array[parent_idx] = array[parent_idx], array[swap_idx]

    BinaryHeap.heapify_down(array, swap_idx, length, &prc)
  end

  def self.default_proc
    Proc.new { |x, y| x <=> y }
  end

  def self.child_indices(parent_idx, length)
    x = parent_idx * 2
    [x + 1, x + 2].select { |idx| idx < length }
  end

  def self.parent_index(child_idx)
    child_idx == 0 ? nil : (child_idx - 1) / 2
  end
end

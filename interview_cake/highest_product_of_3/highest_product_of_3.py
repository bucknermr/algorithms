from binaryheap import MinHeap, MaxHeap
from functools import reduce

# Naive solution:

# def highest_product_of_3(int_list):
#     sorted_list = sorted(int_list)
#     a = sorted_list[0] * sorted_list[1] * sorted_list[-1]
#     b = sorted_list[-1] * sorted_list[-2] * sorted_list[-3]
#     return a if a > b else b
#

# Heaps solution:

def highest_product_of_3(int_list):
    min_heap = MinHeap()
    max_heap = MaxHeap()
    for int in int_list[:3]:
        min_heap.add(int)
        max_heap.add(int)
    max_heap.extract()

    for int in int_list[3:]:
        min_heap.add(int)
        min_heap.extract()
        max_heap.add(int)
        max_heap.extract()

    a = reduce(lambda acc, n: acc * n, min_heap.store)
    for _ in range(2):
        min_heap.extract()
    b = reduce(lambda acc, n: acc * n, max_heap.store) * min_heap.peek()
    return max(a, b)





print(highest_product_of_3([3, 4, 2, 6, 100, 0, 1]) == 2400)
print(highest_product_of_3([-10, -5, 3, 4, 2, 1, 8]) == 400)
print(highest_product_of_3([-299, -4, -1, -12, -3, -5]) == -12)
print(highest_product_of_3([-299, -4, -1, -12, -3, -5, 0]) == 0)

def merge_ranges(meetings):
    sorted_copy = sorted(meetings[:])
    results = [sorted_copy[0]]

    for time in sorted_copy[1:]:
        last = results[-1][1]

        if last >= time[0]:
            results[-1] = (results[-1][0], max(last, time[1]))
        else:
            results.append(time)

    return results


# meetings = [(0, 1), (3, 5), (4, 8), (10, 12), (9, 10)]
# print(merge_ranges(meetings))






def assert_array_equals(a, b, desc):
    if a == b:
        print(f'{desc} ... PASS')
    else:
        print(f'{desc} ... FAIL: {a} != {b}')


desc = 'meetings overlap'
actual = merge_ranges([(1, 3), (2, 4)])
expected = [(1, 4)]
assert_array_equals(actual, expected, desc)

desc = 'meetings touch'
actual = merge_ranges([(5, 6), (6, 8)])
expected = [(5, 8)]
assert_array_equals(actual, expected, desc)

desc = 'meeting contains other meeting'
actual = merge_ranges([(1, 8), (2, 5)])
expected = [(1, 8)]
assert_array_equals(actual, expected, desc)

desc = 'meetings stay separate'
actual = merge_ranges([(1, 3), (4, 8)])
expected = [(1, 3), (4, 8)]
assert_array_equals(actual, expected, desc)

desc = 'multiple merged meetings'
actual = merge_ranges([
  (1, 4),
  (2, 5),
  (5, 8),
])
expected = [(1, 8)]
assert_array_equals(actual, expected, desc)

desc = 'meetings not sorted'
actual = merge_ranges([
  (5, 8),
  (1, 4),
  (6, 8),
])
expected = [(1, 4), (5, 8)]
assert_array_equals(actual, expected, desc)

desc = 'sample input'
actual = merge_ranges([
  (0, 1),
  (3, 5),
  (4, 8),
  (10, 12),
  (9, 10),
])
expected = [
  (0, 1),
  (3, 8),
  (9, 12),
]
assert_array_equals(actual, expected, desc)

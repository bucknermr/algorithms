# https://www.hackerrank.com/challenges/30-regex-patterns/problem

#!/bin/ruby

N = gets.strip.to_i

names = []

for a0 in (0..N-1)
    firstName,emailID = gets.strip.split(' ')
    names << firstName if gmail?(emailId)
end

def gmail?(email)
  email.match?(/@gmail\.com$/)
end

def name_sort(names)
  name_sort_util(names)
end

def name_sort_util(names, start_idx = 0, end_idx = names.length - 1)
  p 'start', start_idx
  p 'end', end_idx
  return names if start_idx >= end_idx

  pivot = names[start_idx].downcase
  barrier = start_idx + 1

  idx = start_idx + 1
  while idx < end_idx
    if pivot > names[idx].downcase
      swap_elements(names, idx, barrier)
      barrier += 1
    end

    idx += 1
  end

  swap_elements(names, start_idx, barrier)

  p 'barrier', barrier

  name_sort_util(names, start_idx, barrier - 1)
  name_sort_util(names, barrier + 1, end_idx)

  names
end

def swap_elements(array, i, j)
  array[i], array[j] = array[j], array[i]
end

# https://www.hackerrank.com/challenges/matrix-rotation-algo/problem

#!/bin/ruby

def matrix_rotation(matrix, n)
  # Complete this function
  start_pos = [0, 0]
  end_pos = [matrix.length - 1, matrix[0].length - 1]
  while start_pos[0] < end_pos[0] && start_pos[1] < end_pos[1]
    rotate_layer(matrix, start_pos, end_pos, n)
    start_pos.map! { |x| x + 1 }
    end_pos.map! { |x| x - 1 }
  end

  matrix
end

def rotate_layer(matrix, start_pos, end_pos, n)
  dist = ((end_pos[0] - start_pos[0]) + (end_pos[1] - start_pos[1])) * 2
  rotations = n % dist
  queue = []

  current_pos = start_pos
  rotations.times do
    queue << matrix[current_pos.first][current_pos.last]
    current_pos = circular_iteration(current_pos, start_pos, end_pos)
  end

  dist.times do
    queue << matrix[current_pos.first][current_pos.last]
    matrix[current_pos.first][current_pos.last] = queue.shift
    current_pos = circular_iteration(current_pos, start_pos, end_pos)
  end

  matrix
end

def circular_iteration(current_pos, start_pos, end_pos)
  if current_pos[1] == start_pos[1]
    return [current_pos[0] + 1, current_pos[1]] if current_pos[0] < end_pos[0]
    [current_pos[0], current_pos[1] + 1]
  elsif current_pos[0] == end_pos[0]
    return [current_pos[0], current_pos[1] + 1] if current_pos[1] < end_pos[1]
    [current_pos[0] - 1, current_pos[1]]
  elsif current_pos[1] == end_pos[1]
    return [current_pos[0] - 1, current_pos[1]] if current_pos[0] > start_pos[0]
    [current_pos[0], current_pos[1] - 1]
  else
    [current_pos[0], current_pos[1] - 1]
  end
end

m, n, r = gets.strip.split(' ')
m = m.to_i
n = n.to_i
r = r.to_i
matrix = Array.new(m)
for matrix_i in (0..m-1)
    matrix_t = gets.strip
    matrix[matrix_i] = matrix_t.split(' ').map(&:to_i)
end
rotated = matrix_rotation(matrix, r)
rotated.each { |layer| puts layer.join(' ') }

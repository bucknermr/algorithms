# https://www.hackerrank.com/contests/cse-830-homework-3/challenges/edit-distance/problem

n = gets.to_i

def edit_distance(str1, str2)
  return str1.length if str2.empty?
  return str2.length if str1.empty?

  last = []
  current = []
  result = nil

  (str1.length + 1).times do |i|
    (str2.length + 1).times do |j|
      if i == 0
        current << j
      elsif j == 0
        current << i
      elsif str1[i - 1] == str2[j - 1]
        current << last[j - 1]
      else
        current << 1 + [current[j - 1], last[j], last[j - 1]].min
      end
    end
    result = current.last
    last = current
    current = []
  end
  result
end


n.times do
  str1 = gets.chomp
  str2 = gets.chomp
  puts edit_distance(str1, str2)
end

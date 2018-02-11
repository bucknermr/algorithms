# https://www.hackerrank.com/challenges/30-review-loop/problem

# Enter your code here. Read input from STDIN. Print output to STDOUT
n = gets.to_i
strings = []
n.times do
  strings << gets.chomp
end

strings.each do |str|
  even = ''
  odd = ''
  str.each_char.with_index do |ch, i|
    if i.even?
      even += ch
    else
      odd += ch
    end
  end
  puts "#{even} #{odd}"
end

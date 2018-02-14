# https://www.hackerrank.com/challenges/30-dictionaries-and-maps/problem

# Enter your code here. Read input from STDIN. Print output to STDOUT

n = gets.to_i
phone_book = {}
n.times do
    line = gets.chomp.split(' ')
    phone_book[line[0]] = line[1]
end

name = gets
while name
    name = name.chomp
    puts phone_book.key?(name) ? "#{name}=#{phone_book[name]}" : 'Not found'
    name = gets
end

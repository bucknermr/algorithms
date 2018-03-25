# https://www.hackerrank.com/challenges/between-two-sets/problem

#!/bin/ruby

#
# Complete the getTotalX function below.
#
def getTotalX(a, b)
  factors_of_b = (1..b.min).select do |num|
    b.all? { |n| num.factor?(n) }
  end

  factors_of_b.select { |num| a.all? { |n| n.factor?(num) } }.length
end

class Integer
  def factor?(other_num)
    other_num % self == 0
  end
end

fp = File.open(ENV['OUTPUT_PATH'], 'w')

nm = gets.rstrip.split

n = nm[0].to_i

m = nm[1].to_i

a = gets.rstrip.split(' ').map(&:to_i)

b = gets.rstrip.split(' ').map(&:to_i)

total = getTotalX a, b

fp.write total
fp.write "\n"

fp.close()

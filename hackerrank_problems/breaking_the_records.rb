# https://www.hackerrank.com/challenges/breaking-best-and-worst-records/problem

#!/bin/ruby

#
# Complete the breakingRecords function below.
#
def breakingRecords(score)
  min = max = score.first
  result = [0, 0]
  score.drop(1).each do |num|
    if num > max
      max = num
      result[0] += 1
    elsif num < min
      min = num
      result[1] += 1
    end
  end

  result
end

fp = File.open(ENV['OUTPUT_PATH'], 'w')

n = gets.to_i

score = gets.rstrip.split(' ').map(&:to_i)

result = breakingRecords score

fp.write result.join " "
fp.write "\n"

fp.close()

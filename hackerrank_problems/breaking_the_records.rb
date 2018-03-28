# https://www.hackerrank.com/challenges/breaking-best-and-worst-records/problem

#!/bin/ruby

#
# Complete the breakingRecords function below.
#
def breakingRecords(score)
    #
    # Write your code here.
    #

end

fp = File.open(ENV['OUTPUT_PATH'], 'w')

n = gets.to_i

score = gets.rstrip.split(' ').map(&:to_i)

result = breakingRecords score

fp.write result.join " "
fp.write "\n"

fp.close()

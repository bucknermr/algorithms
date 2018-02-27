# https://www.hackerrank.com/challenges/grading/problem

#!/bin/ruby

def solve(grades)
    # Complete this function
end

n = gets.strip.to_i
grades = Array.new(n)
for grades_i in (0..n-1)
    grades[grades_i] = gets.strip.to_i
end
result = solve(grades)
print result.join("\n")

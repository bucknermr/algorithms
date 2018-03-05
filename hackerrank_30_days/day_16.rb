# https://www.hackerrank.com/challenges/30-exceptions-string-to-integer/problem

#!/bin/ruby

S = gets.strip

begin
    result = Integer(S)
rescue
    result = 'Bad String'
ensure
    puts result
end

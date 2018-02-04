# https://www.hackerrank.com/challenges/30-conditional-statements/problem

#!/bin/ruby

N = gets.strip.to_i

if N.odd?
    print 'Weird'
elsif N.between?(2, 5) || N > 20
    print 'Not Weird'
else
    print 'Weird'
end

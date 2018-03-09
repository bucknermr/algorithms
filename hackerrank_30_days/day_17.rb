# https://www.hackerrank.com/challenges/30-more-exceptions/problem


# Write your code here

class Calculator
  def power(n, p)
    raise RangeError.new("n and p should be non-negative") if (n < 0 || p < 0)
    n ** p
  end
end

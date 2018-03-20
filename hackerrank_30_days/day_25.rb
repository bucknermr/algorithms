# https://www.hackerrank.com/challenges/30-running-time-and-complexity/problem

# Enter your code here. Read input from STDIN. Print output to STDOUT

# Enter your code here. Read input from STDIN. Print output to STDOUT

def prime?(num)
  return false if num < 2

  i = 2
  while i <= num / i
    return false if num % i == 0
    i += 1
  end

  true
end

n = gets.to_i

n.times do
  puts prime?(gets.to_i) ? "Prime" : "Not prime"
end

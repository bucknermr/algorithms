# https://www.hackerrank.com/challenges/30-nested-logic/problem

# Enter your code here. Read input from STDIN. Print output to STDOUT

require 'date'

class Date
  def Date.create(date_string)
    date_arr = date_string.split(' ').map(&:to_i)
    Date.new(date_arr[2], date_arr[1], date_arr[0])
  end
end

def calculate_fine(return_date_str, due_date_str)
  return_date = Date.create(return_date_str)
  due_date = Date.create(due_date_str)
  return 0 if return_date <= due_date
  if return_date.year == due_date.year
    month_diff = return_date.month - due_date.month
    return (return_date - due_date).to_i * 15 if month_diff == 0
    month_diff * 500
  else
    10000
  end
end

return_date = gets.chomp
due_date = gets.chomp

puts calculate_fine(return_date, due_date)

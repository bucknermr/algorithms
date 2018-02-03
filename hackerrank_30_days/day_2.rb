# Day 2: Operators
#
# https://www.hackerrank.com/challenges/30-operators/problem
#
# Objective
# In this challenge, you'll work with arithmetic operators. Check out the Tutorial tab for learning materials and an instructional video!
#
# Task
# Given the meal price (base cost of a meal), tip percent (the percentage of the meal price being added as tip), and tax percent (the percentage of the meal price being added as tax) for a meal, find and print the meal's total cost.
#
# Note: Be sure to use precise values for your calculations, or you may end up with an incorrectly rounded result!
#
# Input Format
#
# There are  lines of numeric input:
# The first line has a double,  (the cost of the meal before tax and tip).
# The second line has an integer,  (the percentage of  being added as tip).
# The third line has an integer,  (the percentage of  being added as tax).
#
# Output Format
#
# Print The total meal cost is totalCost dollars., where  is the rounded integer result of the entire bill ( with added tax and tip).
#
# Sample Input
#
# 12.00
# 20
# 8
# Sample Output
#
# The total meal cost is 15 dollars.
#
# We round  to the nearest dollar (integer) and then print our result:
#
# The total meal cost is 15 dollars.


#!/bin/ruby

meal_cost = gets.strip.to_f
tip_percent = gets.strip.to_i
tax_percent = gets.strip.to_i

total = meal_cost + (meal_cost * (tip_percent.fdiv(100))) + (meal_cost * (tax_percent.fdiv(100)))
print "The total meal cost is #{total.round} dollars."

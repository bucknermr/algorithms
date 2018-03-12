# https://www.hackerrank.com/challenges/30-queues-stacks/problem

# create the Solution class
class Solution
  	# complete the code
  attr_reader :queue, :stack
  def initialize
    @stack = []
    @queue = []
  end

  def push_character(ch)
    stack << ch
  end

  def enqueue_character(ch)
    queue << ch
  end

  def pop_character
    stack.pop
  end

  def dequeue_character
    stack.shift
  end
end

# https://www.hackerrank.com/challenges/30-binary-trees/problem

def levelOrder(root)
  #Write your code here
  queue = [root]
  result = []
  until queue.empty?
    node = queue.shift
    queue << node.left if node.left
    queue << node.right if node.right

    result << node.data
  end

  puts result.join(' ')
end

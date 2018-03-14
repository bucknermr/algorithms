# https://www.hackerrank.com/challenges/30-binary-search-trees/problem

def getHeight(root)
  #Write your code here
  get_height_util(root, 0)
end

def get_height_util(node, current_height)
  return current_height - 1 unless node

  right_height = get_height_util(node.right, current_height + 1)
  left_height = get_height_util(node.left, current_height + 1)

  [right_height, left_height].max
end

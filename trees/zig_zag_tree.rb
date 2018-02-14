require_relative 'binary_tree'
require 'rspec'


def zig_zag_tree(node)
  current_row = [node]
  next_row = []
  backwards = false

  until current_row.empty?
    until current_row.empty?
      node = current_row.pop
      puts node.val
      zig_zag_util(node, next_row, backwards)
    end

    current_row = next_row
    next_row = []
    backwards = !backwards
  end
end

def zig_zag_util(node, next_row, backwards)
  if backwards
    next_row << node.left if node.left
    next_row << node.right if node.right
  else
    next_row << node.right if node.right
    next_row << node.left if node.left
  end
end

root = BinaryTreeNode.new(11)
root.left = BinaryTreeNode.new(6)
root.right = BinaryTreeNode.new(19)
left = root.left
left.left = BinaryTreeNode.new(4)
left.left.right = BinaryTreeNode.new(5)
left.right = BinaryTreeNode.new(8)
left.right.right = BinaryTreeNode.new(10)
right = root.right
right.left = BinaryTreeNode.new(17)
right.right = BinaryTreeNode.new(43)
right.right.left = BinaryTreeNode.new(31)
right.right.right = BinaryTreeNode.new(49)

zig_zag_tree(root) # => 11 6 19 43 17 8 4 5 10 31 49

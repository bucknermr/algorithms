class BinaryTreeNode
  attr_accessor :left, :right, :parent, :val

  def initialize(val = nil, parent = nil)
    @val = val
    @parent = parent
  end
end

class BSTNode
  attr_accessor :left, :right
  attr_reader :value

  def initialize(value)
    @value = value
    @left = nil
    @right = nil
  end
end


class BinarySearchTree
  def initialize
    @root = nil
  end

  def insert(value)
    unless @root
      @root = BSTNode.new(value)
      return
    end

    BinarySearchTree.insert!(@root, value)
  end

  def self.insert!(node = nil, value)
    return BSTNode.new(value) unless node

    if value < node.value
      node.left = BinarySearchTree.insert!(node.left, value)
    else
      node.right = BinarySearchTree.insert(node.right, value)
    end

    node
  end
end

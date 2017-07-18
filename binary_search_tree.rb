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

  def self.insert!(node, value)
    return BSTNode.new(value) unless node

    if value <= node.value
      node.left = BinarySearchTree.insert!(node.left, value)
    else
      node.right = BinarySearchTree.insert!(node.right, value)
    end

    node
  end

  def self.min(node)
    return nil unless node

    if node.left.nil?
      return node
    else
      return BinarySearchTree.min(node.left)
    end
  end

  def self.max(node)
    return nil unless node

    if node.right.nil?
      return node
    else
      return BinarySearchTree.max(node.right)
    end
  end
end

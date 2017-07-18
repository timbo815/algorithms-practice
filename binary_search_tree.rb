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

  def find(value)
    BinarySearchTree.find!(@root, value)
  end

  def inorder
    BinarySearchTree.inorder!(@root)
  end

  def preorder
    BinarySearchTree.preorder!(@root)
  end

  def postorder
    BinarySearchTree.postorder!(@root)
  end

  def height
    BinarySearchTree.height!(@root)
  end

  def min
    BinarySearchTree.min(@root)
  end

  def max
    BinarySearchTree.max(@root)
  end

  def delete(value)
    BinarySearchTree.delete!(@root, value)
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

  def self.find!(node, value)
    return nil unless node
    return node if node.value == value

    if value < node.value
      BinarySearchTree.find!(node.left, value)
    else
      BinarySearchTree.find!(node.right, value)
    end
  end

  def self.height!(node)
    return -1 if node.nil?

    left_height = 1 + BinarySearchTree.height!(node.left)
    right_height = 1 + BinarySearchTree.height!(node.right)

    return [left_height, right_height].max
  end

  def self.delete_min!(node)
    return nil if node.nil?
    return node.right unless node.left

    node.left = BinarySearchTree.delete_min!(node.left)
    node
  end

  def self.delete!(node, value)
    return nil unless node

    if value < node.value
      node.left = BinarySearchTree.delete!(node.left, value)
    elsif value > node.value
      node.right = BinarySearchTree.delete!(node.right, value)
    else
      return node.left unless node.right
      return node.right unless node.left

      target_node = node
      node = BinarySearchTree.min(target_node.right)
      node.right = BinarySearchTree.delete_min!(target_node.right)
      node.left = target_node.left
    end

    node
  end

  def self.inorder!(node)
    return [] unless node

    ordered_array = []
    ordered_array += BinarySearchTree.inorder!(node.left) if node.left
    ordered_array << node.value
    ordered_array += BinarySearchTree.inorder!(node.right) if node.right

    ordered_array
  end

  def self.preorder!(node)
    return [] if node.nil?
    preordered_array = [node.value]
    preordered_array += BinarySearchTree.preorder!(node.left) if node.left
    preordered_array += BinarySearchTree.preorder!(node.right) if node.right
    preordered_array
  end

  def self.postorder!(node)
    return [] if node.nil?
    postordered_array = []
    postordered_array += BinarySearchTree.postorder!(node.left) if node.left
    postordered_array += BinarySearchTree.postorder!(node.right) if node.right
    postordered_array << node.value
  end
end

require "pry"
class Node
  attr_accessor :left, :right, :val, :parent

  def initialize(left:nil, right:nil, parent:nil, val:)
    @left = left
    @right = right
    @parent = parent
    @val = val
  end

  def insert(new_val)
    next_node = self

    while next_node != nil
      next_node = if new_val <= next_node.val
                    break unless next_node.left
                    next_node.left
                  else
                    break unless next_node.right
                    next_node.right
                  end
    end

    if new_val <= next_node.val
      next_node.left = Node.new(val: new_val)
    else
      next_node.right = Node.new(val: new_val)
    end
  end
end

class BinaryTree
  attr_accessor :root

  def insert(val)
    if self.root == nil
      self.root = Node.new(val: val)
    else
      self.root.insert(val)
    end
  end

  def in_order(node=@root, &block)
    return if node.nil?
    in_order(node.left, &block)
    yield node
    in_order(node.right, &block)
  end

  def pre_order(node=@root, &block)
    return if node.nil?
    yield node
    pre_order(node.left, &block)
    pre_order(node.right, &block)
  end

  def find(node=@root, val)
    return nil if node.nil?

    if node.val > val
      find(node.left, val)
    elsif node.val < val
      find(node.right, val)
    else
      return node
    end
  end
end

tree = BinaryTree.new
tree.insert(50)
tree.insert(25)
tree.insert(75)
tree.insert(12)
tree.insert(37)
tree.insert(87)
tree.insert(63)
tree.in_order{ |node| puts node.val }
tree.pre_order{ |node| puts node.val }
puts tree.find(63)
binding.pry

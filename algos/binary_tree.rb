class BinaryTree
  attr_accessor :root

  def initialize(root=nil)
    @root = root
  end

  def add(node=root, val)
    if root.nil?
      self.root = Node.new(val)
      return
    end

    self.root.add(self.root, val)
  end
end

class Node
  attr_accessor :val, :left, :right

  def initialize(val, left=nil, right=nil)
    @val = val
    @left = left
    @right = right
  end

  def add(node, val)
    if val < node.val
      if node.left
        add(node.left, val)
      else
        node.left = Node.new(val)
      end
    else
      if node.right
        add(node.right, val)
      else
        node.right = Node.new(val)
      end
    end
  end
end

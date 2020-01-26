require 'pry'

class AvlBinaryTree
  attr_accessor :root

  def initialize(root=nil)
    @root = root
  end

  def balanced?
    self.root.balanced?
  end

  def add(val)
    if self.root.nil?
      self.root = Node.new(val)
      return
    end

    self.root = self.root.add(val)
  end

  def horizontal_traversal
    queue = []

    queue.push(self.root)

    while queue.any?
      elem = queue.shift

      queue.push(*[elem.left, elem.right].compact)

      puts elem.val
    end
  end
end

class Node
  attr_accessor :val, :left, :right, :height

  def initialize(val, left=nil, right=nil, height=0)
    @val = val
    @left = left
    @right = right
    @height = height
  end

  def compute_height
    height = -1

    if self.left
      height = [height, self.left.height].max
    end

    if self.right
      height = [height, self.right.height].max
    end

    self.height = height + 1
  end

  def height_difference
    left_height = 0
    right_height = 0

    if self.left
      left_height = 1 + left.height
    end

    if self.right
      right_height = 1 + right.height
    end

    left_height - right_height
  end

  def balanced?
    height_difference.abs < 2
  end

  def add(val)
    new_root = self

    if val <= self.val
      if self.left.nil?
        self.left = Node.new(val)
      else
        self.left.add(val)
      end

      if self.height_difference == 2
        if val <= self.left.val
          new_root = self.rotate_right
        else
          new_root = self.rotate_left_right
        end
      end
    else
      if self.right.nil?
        self.right = Node.new(val)
      else
        self.right.add(val)
      end

      if self.height_difference == -2
        if val > self.right.val
          puts self.val
          new_root = self.rotate_left
        else
          new_root = self.rotate_right_left
        end
      end
    end

    new_root.compute_height
    new_root
  end

  def rotate_right
    new_root = self.left
    grandson = new_root.right
    self.left = grandson
    new_root.right = self

    self.compute_height

    return new_root
  end

  def rotate_left
    new_root = self.right
    grandson = new_root.left
    self.right = grandson
    new_root.left = self

    self.compute_height
    return new_root
  end

  def rotate_right_left
    child = self.right
    new_root = child.left
    grand1 = new_root.left
    grand2 = new_root.right
    child.left = grand2
    self.right = grand1

    new_root.left = self
    new_root.right = child

    child.compute_height
    self.compute_height

    return new_root
  end

  def rotate_left_right
    child = self.left
    new_root = child.right
    grand1 = new_root.left
    grand2 = new_root.right
    child.right = grand1
    self.left = grand2

    new_root.left = child
    new_root.right = self

    child.compute_height
    self.compute_height

    return new_root
  end
end

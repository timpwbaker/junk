class StackNode
  attr_accessor :nxt
  attr_reader :val

  def initialize(val)
    @nxt = nxt
    @val = val
  end
end

class StackMax
  attr_accessor :max, :first

  def push(node)
    raise ArgumentError.new("can only add StackNodes") if node.class.name != "StackNode"
    raise ArgumentError.new("node must have val") if node.val.nil?

    if !first
      self.first = node
      self.max = node.val
    else
      node.nxt = self.first
      self.first = node
      self.max = node.val if node.val > self.max
    end

    self
  end

  def pop
    out = self.first
    self.first = node.val

    out
  end
end

puts StackMax.new.push(StackNode.new(1)).push(StackNode.new(9)).push(StackNode.new(4)).max

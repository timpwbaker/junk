require 'set'

class UnweightedGraph
  class Node
    attr_reader :val
    attr_accessor :edges

    def initialize(val, edges=[])
      @val = val
      @edges = edges
    end
  end

  attr_reader :nodes
  attr_accessor :edges

  def initialize(nodes)
    @nodes = nodes.map{ |n| [n.val, n] }.to_h
  end

  def add_edges(edges)
    edges.each do |edge|
      from = edge[0]
      to = edge[1]

      from_node = nodes[from]
      to_node = nodes[to]

      from_node.edges << to_node.val
      to_node.edges << from_node.val
    end
  end

  def breadth_first_search(start_node)
    # queue
    queue = []
    seen = Set.new

    queue << start_node

    while queue.any?
      node = queue.pop
      unless seen.include?(node)
        puts node.val
        queue = queue + node.edges.map{ |e| nodes[e] }
        seen.add(node)
      end
    end
  end

  def depth_first_search(start_node)
    stack = []
    seen = Set.new

    stack << start_node

    while stack.any?
      node = stack.shift
      unless seen.include?(node)
        puts node.val
        stack = stack + node.edges.map{ |e| nodes[e] }
        seen.add(node)
      end
    end
  end
end

nodes = %w[A B C D E F G H].map{ |n| UnweightedGraph::Node.new(n) }
graph = UnweightedGraph.new(nodes)
edges = [
  %w[A B],
  %w[A C],
  %w[A D],
  %w[A E],
  %w[B C],
  %w[C D],
  %w[D E],
  %w[D H],
  %w[E F],
  %w[H F],
  %w[F G],
  %w[G B]
]
graph.add_edges(edges)

graph.breadth_first_search(nodes.first)
graph.depth_first_search(nodes.first)

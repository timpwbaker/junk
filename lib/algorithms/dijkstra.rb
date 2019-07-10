class Dijkstra
  attr_reader :graph

  def initialize(graph)
    @graph = graph
  end

  def calculate_shortest_distance(start_node, end_node)
    start_node = graph.nodes[start_node]
    end_node = graph.nodes[end_node]
    if start_node.nil? || end_node.nil?
      raise ArgumentError, "One or both of these nodes don't exist"
    end

    sd = shortest_distance(start_node, end_node)
    if sd.nil?
      raise ArgumentError, "It's not possible to travel from #{start_node.id} to #{end_node.id}"
    else
      return sd
    end
  end

  private

  def shortest_distance(start_node, end_node)
    grid = build_grid(start_node, graph)

    loop do
      next_node = find_next_node(start_node, grid)
      if next_node.nil?
        break
      end

      calculate_edges(next_node, grid)

    end

    grid[end_node.id][:shortest_distance]
  end

  def find_next_node(start_node, grid)
    to_be_visited = grid.select{|k, v| v[:unvisited] && !v[:shortest_distance].nil?}
    if to_be_visited.empty?
      return nil
    end

    next_node_id = to_be_visited.min_by{|k, v| v[:shortest_distance]}.first

    graph.nodes[next_node_id]
  end

  def calculate_edges(next_node, grid)
    next_node.edges.each do |e|
      dest_node_id = e.destination_node.id
      current_node_value = grid[next_node.id][:shortest_distance]
      dest_node_value = grid[dest_node_id][:shortest_distance]
      edge_weight = e.weight

      new_value = current_node_value + edge_weight

      if dest_node_value.nil? || new_value < dest_node_value
        grid[dest_node_id][:shortest_distance] = new_value
      end
    end

    grid[next_node.id][:unvisited] = false
  end

  def build_grid(start_node, graph)
    graph.nodes.map{ |k, v|
      if k == start_node.id
        [k, { id: k, unvisited: true, shortest_distance: 0}]
      else
        [k, { id: k, unvisited: true }]
      end
    }.to_h
  end
end

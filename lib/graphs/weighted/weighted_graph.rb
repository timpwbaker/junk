require_relative '../../algorithms/dijkstra.rb'
require 'benchmark'
require 'pry'
require 'faker'

class WeightedGraph
  attr_reader :nodes

  def initialize(nodes:)
    @nodes = nodes
  end

  def self.build_known_test_graph
    node_ids = ["Oxford", "Cambridge", "London", "Paris", "Billericay", "Edinburgh"]

    nodes = node_ids.map{|id| [id, WeightedNode.new(id: id)] }.to_h
    node_edges = {
      ["Oxford", "Cambridge"] => 2,
      ["Cambridge", "Oxford"] => 2,
      ["London", "Paris"] => 20,
      ["London", "Billericay"] => 34,
      ["Billericay", "Paris"] => 14,
      ["Paris", "Edinburgh"] => 44,
      ["Edinburgh", "Oxford"] => 2
    }

    weighted_graph = WeightedGraph.new(nodes: nodes)
    weighted_graph.add_edges(node_edges)

    weighted_graph
  end

  def self.build_test_graph(number_of_nodes, number_of_edges)
    node_ids = (1..number_of_nodes).map{ Faker::Address.city }.uniq + ["Oxford", "Cambridge"]

    nodes = node_ids.map{|id| [id, WeightedNode.new(id: id)] }.to_h
    node_edges = (1..number_of_edges).map{
      shuff = node_ids.shuffle
      [[shuff.first, shuff.last], rand(number_of_nodes * 3)]
    }.to_h

    weighted_graph = WeightedGraph.new(nodes: nodes)
    weighted_graph.add_edges(node_edges)

    weighted_graph
  end

  def add_edges(edges)
    edges.each do |k,v|
      source_node = nodes[k[0]]
      destination_node = nodes[k[1]]
      source_node.edges << WeightedEdge.new(destination_node: destination_node, weight: v)
    end
  end

  def print_english
    para_arr = []

    nodes.each do |k, v|
      para_arr << "Node: #{k}"
      v.edges.each do |e|
        para_arr << "  #{v.id} links to #{e.destination_node.id} with weight #{e.weight}"
      end
    end

    para_arr
  end
end

class WeightedNode
  attr_reader :id
  attr_accessor :edges

  def initialize(id:)
    @id = id
    @edges = []
  end
end

class WeightedEdge
  attr_reader :destination_node, :weight

  def initialize(destination_node:, weight:)
    @destination_node = destination_node
    @weight = weight
  end
end

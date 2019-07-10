require "spec_helper"

RSpec.describe Dijkstra, "Getting from A to B (or C)" do
  let(:known_test_graph) do
    node_ids = ["Oxford", "Cambridge", "London", "Paris", "Billericay", "Edinburgh", "Atlantis"]

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

  it "works out the most efficient route" do
    shortest_distance = Dijkstra.new(known_test_graph).calculate_shortest_distance("Billericay", "Cambridge")

    expect(shortest_distance).to eq 14 + 44 + 2 + 2
  end

  it "raises an error if node doesn't exist" do
    expect{
      Dijkstra.new(known_test_graph).calculate_shortest_distance("Billericay", "Foobar")
    }.to raise_error(ArgumentError, "One or both of these nodes don't exist")
  end

  it "raises an error if it's an impossible journey" do
    expect{
      Dijkstra.new(known_test_graph).calculate_shortest_distance("Billericay", "Atlantis")
    }.to raise_error(ArgumentError, "It's not possible to travel from Billericay to Atlantis")
  end
end

require "spec_helper"

RSpec.describe WeightedGraph, "creating weighted graphs" do
  let(:number_of_nodes){ 100 }
  let(:number_of_edges){ 100 }
  let(:node_ids){ (1..number_of_nodes).map{ Faker::Address.city }.uniq + ["Oxford", "Cambridge"] }
  let(:nodes){ node_ids.map{|id| [id, WeightedNode.new(id: id)] }.to_h }
  let(:node_edges) do
    node_edges = (1..number_of_edges).map{
      shuff = node_ids.shuffle
      [[shuff.first, shuff.last], rand(number_of_nodes * 3)]
    }.to_h
  end

  it "creates a graph" do
    graph = WeightedGraph.new(nodes: nodes)

    expect(graph.nodes.count).to eq 102
  end

  it "can add edges" do
    graph = WeightedGraph.new(nodes: nodes)
    graph.add_edges(node_edges)

    edges = []
    graph.nodes.each do |n|
      n[1].edges.each do |e|
        edges << e
      end
    end

    expect(edges.count).to eq 100
  end
end

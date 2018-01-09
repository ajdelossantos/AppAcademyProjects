class Vertex
  attr_reader :in_edges, :out_edges
  attr_accessor :value

  def initialize(value)
    @value = value
    @in_edges = []
    @out_edges = []
  end

  def add_in_edge!(edge)
    @in_edges << edge unless @in_edges.include?(edge)
  end
  
  def add_out_edge!(edge)
    @out_edges << edge unless @out_edges.include?(edge)
  end

  def remove_in_edge!(edge)
    @in_edges.reject! { |el| el == edge}
  end

  def remove_out_edge!(edge)
    @out_edges.reject! { |el| el == edge}
  end

  def traverse_out
    @out_edges.map!(:to_vertex)
  end

  def traverse_in
    @in_edges.map!(:from_vertex)
  end
end

class Edge
  attr_reader :from_vertex, :to_vertex
  attr_accessor :cost

  def initialize(from_vertex, to_vertex, cost = 1)
    @cost = cost
    @from_vertex = from_vertex
    @to_vertex = to_vertex

    @from_vertex.add_out_edge!(self)
    @to_vertex.add_in_edge!(self)
  end

  def destroy!
    @from_vertex.remove_out_edge!(self)
    @to_vertex.remove_in_edge!(self)
    @from_vertex, @to_vertex = nil
  end
end

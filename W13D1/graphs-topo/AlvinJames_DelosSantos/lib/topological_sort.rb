require_relative 'graph'

# Implementing topological sort using both Khan's and Tarian's algorithms

def topological_sort(vertices)
  sorted = []
  top = []

  vertices.each { |vertex| top.unshift(vertex) if vertex.in_edges.empty? }

  until top.empty?
    current = top.pop
    sorted << current
    
    edges_len = current.out_edges.length
    edges_len.times do
      edge = current.out_edges.shift
      top.unshift(edge) if edge.to_vertex.in_edges.empty?
      edge.destroy!
    end
    
    vertices.each do |vertex|
      if vertex.in_edges.empty?
        top.unshift(vertex) unless top.include?(vertex) || sorted.include?(vertex)
      end
    end
  end

  in_edges = sorted.map { |v| v.in_edges }
  in_edges.map! { |e| e.empty? }

  in_edges.all? { |bool| bool } && sorted.length == vertices.length ? sorted : []
end
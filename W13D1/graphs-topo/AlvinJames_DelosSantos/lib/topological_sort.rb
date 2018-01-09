require_relative 'graph'

# Implementing topological sort using both Khan's and Tarian's algorithms

def topological_sort(vertices)
  #beware Array#each
  # queue up all vertices w/ n in-edges
  # pop off vertices from queue
    # Remove vertex + out_edges from graph
    # Push vertices into sorted array
    # Examine destination vertices, push onto queue if no more in-edges
  sorted = []
  top = [] # a queue

  vertices.each do |vertex|
    if vertex.in_edges.empty?
      top.unshift(vertex)
    end
  end

  until top.empty?
    current = top.pop
    sorted << current

    current.out_edges.each do |edge|
      if edge.to_vertex.in_edges.empty?
        top.unshift(edge)
      end
      vertices.delete(edge)
    end
  sorted
  end
end


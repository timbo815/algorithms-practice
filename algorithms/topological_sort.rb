require_relative '../data_structures/graph'

# Kahn's algorithm
def topological_sort(vertices)
  sorted = []
  vertex_in_count_hash = {}
  queue = []

  vertices.each do |vertex|
    vertex_in_count_hash[vertex] = vertex.in_edges.count
    queue << vertex if vertex.in_edges.empty?
  end

  until queue.empty?
    current = queue.shift
    sorted << current

    current.out_edges.each do |out_edge|
      to_vertex = out_edge.to_vertex
      vertex_in_count_hash[to_vertex] -= 1
      queue << to_vertex if vertex_in_count_hash[to_vertex] == 0
    end
  end

  sorted
end

num_of_vertices, max_visits, num_of_edges = gets.split ' '
n = num_of_vertices
edges_for_vertex = {}
num_of_edges.times {
  u, v, w = gets.split ' '
  next if u > v
  edge_list = edges_for_vertex[u] || []
  edge_list.insert(-1, [v, w])
  edges_for_vertex[u] = edge_list
}

minus_inf = -1.0/0

memoize = [[]] * num_of_vertices
(1..num_of_vertices).reverse_each { |u|
  (2..max_visits).each { |m|
    memoize[u][m] = 0 and next if u == n
    # or weight
    if m == 1
      memoize[u][m] = minus_inf
      memoize[u][m] =
        edges_for_vertex[u]
          .select { |v, w| v == n }
          .sort_by { |v, w| w }
          .last
    end
    edges_for_vertex[u].map { |v, w|
      memozie[v][m - 1] + w
    }.max
    memoize[u][m]
    # memoize[u] = 
  }
}

class Vertex
  attr_reader :in_edges, :out_edges
  attr_accessor :val

  def initialize(val)
    @val = val
    @in_edges = []
    @out_edges = []
  end
end

class Edge
  attr_accessor :from_vertex, :to_veretx, :weight

  def initialize(from_vertex, to_vertex, weight = 1)
    @from_vertex = from_vertex
    @to_vertex = to_vertex
    @weight = weight
    from_vertex.out_edges << self
    to_vertex.in_edges << self
  end

  def delete
    from_vertex.out_edges.delete(self)
    to_vertex.out_edges.delete(self)
    
  end
end

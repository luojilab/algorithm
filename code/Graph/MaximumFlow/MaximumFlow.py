class Edge(object):
  def __init__(self, u, v, w):
    self.source = u
    self.target = v
    self.capacity = w

  def __repr__(self):
    return "%s->%s:%s" % (self.source, self.target, self.capacity)

class FlowNetwork(object):
  def  __init__(self):
    self.adj = {}
    self.flow = {}

  def AddVertex(self, vertex):
    self.adj[vertex] = []

  def GetEdges(self, v):
    return self.adj[v]

  def AddEdge(self, u, v, w = 0):
    if u == v:
      raise ValueError("u == v")
    edge = Edge(u, v, w)
    redge = Edge(v, u, 0)
    edge.redge = redge
    redge.redge = edge
    self.adj[u].append(edge)
    self.adj[v].append(redge)
    # Intialize all flows to zero
    self.flow[edge] = 0
    self.flow[redge] = 0

  def FindPath(self, source, target, path):
    if source == target:
      return path
    for edge in self.GetEdges(source):
      residual = edge.capacity - self.flow[edge]
      if residual > 0 and not (edge, residual) in path:
        result = self.FindPath(edge.target, target, path + [(edge, residual)])
        if result != None:
          return result

  def MaxFlow(self, source, target):
    path = self.FindPath(source, target, [])
    while path != None:
      flow = min(res for edge, res in path)
      for edge, res in path:
        self.flow[edge] += flow
        self.flow[edge.redge] -= flow
      path = self.FindPath(source, target, [])
    return sum(self.flow[edge] for edge in self.GetEdges(source))

if __name__ == "__main__":
  g = FlowNetwork()
  map(g.AddVertex, ['s', 'V1', 'V2', 'V3', 'V4', 't'])
  g.AddEdge('s', 'V1', 16)
  g.AddEdge('s', 'V2', 13)
  g.AddEdge('V1', 'V3', 12)
  g.AddEdge('V2', 'V4', 14)
  g.AddEdge('V3', 't', 20)
  g.AddEdge('V4', 't', 4)
  g.AddEdge('V2', 'V1', 4)
  g.AddEdge('V3', 'V2', 9)
  g.AddEdge('V4', 'V3', 7)
  
  print g.MaxFlow('s', 't')
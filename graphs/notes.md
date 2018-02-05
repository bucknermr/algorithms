G = (V, E)

Where n = |V|, max num edges (no multi-edge or self-edge):
* n(n-1) for directed graph
* n(n - 1) / 2 for undirected graph

Max |E| for directed graph approaches |V|<sup>2</sup>.

A Graph is dense (or sparse) if |E| is close to (or far away from) the max ( |V|<sup>2</sup> ).

Dense Graph: store with Adjacency Matrix

Sparse Graph: store with Adjacency List


**Path**
* sequence of vertices where each adjacent pair is connected by an edge
* Path is 'simple' if no vertices are repeated (and therefore no edges)
* 'Path' usually means 'simple path'

**Walk**
* Path with repeated vertices/edges
* **Trail**: walk where vertices *can* be repeated but edges *cannot* be repeated
* **Closed walk**: walk that starts and ends at same vertex && length of walk > 0

**Cycle**
* also called **Simple Cycle**
* apart from start/end vertices, no other vertex/edge is repeated
* **Acyclic Graph**: graph with no possible cycle
  * ex: tree (undirected acyclic graph)

**Strongly Connected**
* Graph is strongly connected if there is a path from any vertex to any other vertex
* Undirected graph's can be **connected**, directed graphs can be **strongly connected**
* If directed graph is **not** strongly connected, but could be turned into connected graph by treating all edges as undirected, it is called **wealky connected**

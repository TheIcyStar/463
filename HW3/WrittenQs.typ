#set text(size: 13pt)
#set page(
  paper: "us-letter",
  margin: (x: 0.5in, y: 1in),
  header: [
    *Alexander Petrov*
    #h(1fr)
    *CMPSC 463: Homework 3*
  #line(length: 100%)
  ],
  numbering: "1"
)
#let answer(content) = {
  block(
    fill: rgb("f0f0ff"),
    width: 100%,
    radius: 0.5em,
    inset: 1.75em,
    content
  )
}

1. Draw two examples of directed graphs with negative-weight edges that Dijkstra's algorithm produces wrong results. For each graph, explain why the algorithm gets the incorrect answer.
#answer([
  Figure 1 shows that the least-cost path from A to D is through B, but Dijkstra's algorithm will not expand B, as it assumes that any already expanded nodes cannot have their paths weight decrease in future expansions.
  #figure(image("Assets/q1p1.svg"), caption: [A directed graph a negative weight edge])

  Figure 2's graph contains a negative weight loop, which makes the shortest path from A to D indeterminate, but Dijkstra's algorithms will still return some result.
  #figure(image("Assets/q1p2.svg"), caption: [A directed graph with a negative weight loop])
])

#pagebreak()

2. Consider a directed graph $G = (V,E)$ with weighted edges but no negative-weight cycles. Consider m as the maximum number of edges over all shortest paths from the source $s$ to $v$. Note that the shortest path is by the minimum path weight, not the number of edges.  Modify the Bellman-Ford algorithm to terminate in $m+1$ passes, but $m$ is not known in advance ($m$ is unknown).
#answer([
  Terminate the algorithm as soon as no relaxations were done in a pass.
  The iteration with the last set of relaxations will be $m$, and the relaxation-less iteration
  will be m+1.
])



3. Suppose that you are given a weighted, directed graph $G = (V,E)$ in which edges that leave the source vertex s may have negative weights, all other edge weights are nonnegative, and there are no negative-weight cycles. Argue that Dijkstra's algorithm correctly finds the shortest paths from s in this graph.
#answer([
  At the start of Dijkstra's run, all nodes out of $s$ are added to the queue, regardless of edge weight. Because of this, the case of Dijkstra's algorithm failing to consider decreasing path costs because of expanding nodes with negative edges going out of them is not applicable. Since the graph has no further negative weight edges after the initial edges from $s$, Dijkstra's algorithm will proceed normally.
])

#pagebreak()

4. Argue that if all edge weights of a graph are positive, then any subset of edges that connects all vertices and has minimum total weight must be a tree. Give an example to show that the same conclusion does not follow if we allow some weights to be nonpositive.
#answer([
  This scenario describes a minimum spanning tree. If the original graph contains a loop, then considering that loop will only increase path costs and will therefore not be part of a minimum spanning tree. As loops are not included, the structure remains a tree. Negative weight edges weights break this by decreasing total weight by adding more connections. As an example, consider Figure 3, where to achieve the minimum total weight, all edges must be picked.

  #figure(image("Assets/q4.svg"), caption: [A graph with all negative weights])

])
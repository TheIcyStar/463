#set text(size: 13pt)
#set page(
  paper: "us-letter",
  margin: (x: 0.5in, y: 1in),
  header: [
    *Alexander Petrov*
    #h(1fr)
    *CMPSC 463: Homework 4*
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

= Question 1
Explain the difference between top-down (memoization) and bottom-up (tabulation) approaches in dynamic programming.
- Use an example (such as Fibonacci sequence computation) to illustrate how both methods avoid redundant calculations.
- Discuss which approach is generally more memory efficient and why.

#answer([
   Top-down solutions start from the general case and work "downard" to the subproblems. For any overlapping subproblems, memoization provides already computed results so that existing work can be reused. Bottom-up approaches begin from the subproblems and work "upwards" to the original problem.

   For calculating the Fibonacci sequence, consider Figure 1. An implementation using a top-down approach would begin at the top of the tree and recurse down the left-most branches. After reaching the base cases, all of the memoized solutions would be available as subproblems finish recursing back up the tree.

   #figure(
    image("Assets/Q1p1.svg", width: 75%),
    caption: "A tree representing a Fibonacci function. Redundant work is represented by blue nodes. "
   )

   A bottom-up implementation would start at the left-most base cases (i.e. `Fib(1)` and `Fib(2)`) and work up to `Fib(n)`.

   The Top-down approach would require $O(n)$ space for memoization and the function call stack, while a bottom-up approach can simply keep track of the last two entires in a simple for loop. Thus, the bottom-up approach is more memory efficient.
])

= Question 2
From the uploaded lecture's discussion of optimal substructure and overlapping subproblems, identify one problem example where these properties are explicitly used (for instance, Matrix Chain Multiplication, Longest Common Subsequence, or Knapsack Problem).
- Derive the recurrence relation for that problem.
- Write pseudocode to implement the dynamic programming solution.

#answer([
  The solution to the matrix chain multiplication problem uses both optimal substructures and overlapping subproblems. Once we find the best way to add parentheses to the multiplication chain, all other problems that build ontop of that initial chain will have the same solution for minimal multiplication cost. The overlapping subproblems come from the fact that there are many ways to split the original chain of matrices to produce the same sub-chains.


  For a matrix chain of length $n$, there are $n-1$ spots to make the cut. Each cut produces two subproblems: the first being a subchain up to the cut at position $k$ and the subchain after the cut. This is then followed by finding the minimum out of the $n-1$ cuts. Thus, the recurrence relation is:

  $
    T(i,j) & = cases(
      0   & "if" i = j,
      "min"{T(i,k) + T(k+1, j) + P(A_(i,k) thick, A_(k+1,j)) | i <= k < j} quad & "if" i < j
    )
  $

  and $P$ is the cost of multiplying two matrices. (e.g. given an $m times n$ and $n times p$ matrix, it returns $m dot n dot p$)

  #v(3em)
  (implementation on next page)

  #colbreak()

  Python-like pseudocode:
  ```py
  cost_memo = {} # dictionary, tuple (a,b) keys, cost values
  def Mat_Chain(matrices, startIndex, endIndex):
    # if we know the cost, return
    if cost_memo[(startIndex,endIndex)] is not None:
      return cost_memo[(startIndex,endIndex)]

    # if no more subproblems, calc, memo, and return
    if startIndex == endIndex:
      cost_memo[(startIndex,endIndex)] = 0
      return 0

    # get costs of all the cuts
    sub_costs = []
    for i in range(startIndex, endIndex): # start..(end-1)
      cost_left = Mat_Chain(matrices, startIndex, i)
      cost_right = Mat_Chain(matrices, i+1, endIndex)
      # left/right_matrix are A_i,k and A_k+1,j where k is the cut
      cost_LtimesR = (
        left_matrix.size.rows *
        left_matrix.size.cols *
        right_matrix.size.cols
      )
      sub_costs.append(cost_left + cost_right + cost_LtimesR)

    # put best found cost in memo and return
    best = min(sub_costs)
    cost_memo[(startIndex,endIndex)] = best
    return best

  ```
])

#pagebreak()
= Question 3
Consider the 0/1 Knapsack Problem where you are given $n$ items with weights $w_i$ and values $v_i$, and a knapsack capacity $W$.
- Formulate the dynamic programming recurrence.
- Analyze the time and space complexity of your approach.
- Suggest one possible optimization to reduce space usage while maintaining correctness.

#answer([
  0/1 Knapsack is solved with the help of a 2D array (the dp matrix), where the columns represent weight values from $0$ to $W$, and rows each item.
  The matrix gets built as such:\
  (Python-like pseudocode)
  ```py
  for i in range(1, n+1): # items (rows)
    for w in range(W+1): # weights (columns)
      w_i = current items weight
      v_i = current items value
      if w_i > w: # if current item's weight is greater than this iter's weight
        dp_matrix[i][w] = dp_matrix[i-1][w] # use value from above cell
      else:
        dp_matrix[i][w] = max(
          dp_matrix[i-1][w], # cell above, or
          v_i + dp_matrix[i-1][w-w_i] # value if item is included
        )
  ```

  I am unsure on how to formulate the recurrence relation in mathematical notation for this implementation.

  ==== Time complexity

  Depending on the output requirement of the problem (output only the highest cost and/or the set of items chosen), the dp matrix will provide the answer. This part is not part of the recurrence.

  The dp matrix has a size of $n times W$, and as the algorithm goes over each cell, its time complexity is $O(n dot W)$

  ==== Optimization
  To improve space usage, only the cells where the value changes while reading from left to right can be saved. For example, for a row of length of 5 with the following values: `[0,3,3,3,5]`, we can simply store the value `3` with its position (in this case, `1`), and assume all of the cells to the right are also 3's, up to the next stored value of 5.
])
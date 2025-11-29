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

   For calculating the Fibonacci sequence, a top-down approach
])

= Question 2
From the uploaded lecture’s discussion of optimal substructure and overlapping subproblems, identify one problem example where these properties are explicitly used (for instance, Matrix Chain Multiplication, Longest Common Subsequence, or Knapsack Problem).
- Derive the recurrence relation for that problem.
- Write pseudocode to implement the dynamic programming solution.

#answer([

])

= Question 3
Consider the 0/1 Knapsack Problem where you are given n items with weights w_i and values v_i, and a knapsack capacity W.
- Formulate the dynamic programming recurrence.
- Analyze the time and space complexity of your approach.
- Suggest one possible optimization to reduce space usage while maintaining correctness.

#answer([

])
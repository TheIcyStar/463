#set text(size: 13pt)
#set page(
  paper: "us-letter",
  margin: (x: 0.5in, y: 1in),
  header: [
    *Alexander Petrov*
    #h(1fr)
    *CMPSC 463: Homework 1*
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

= Theory problems

1. _What is the primary disadvantage of using a brute-force approach like an exhaustive search for solving problems, particularly as the input size grows?_
#answer([
  Brute-force solutions search the entire problem space. Given enough problem complexity, the problem space may grow beyond reasonable means even with relatively small input sizes.
])

2. _In the context of greedy algorithms, what does it mean to make a "locally optimal choice"?_
#answer([
  While the algorithm is processing the input, it considers the current item being iterated upon and a few logically adjacent items. For example, in list-type problems, only adjacent items are considered. In graph-type problems, only the current node's neighbors are considered. The algorithm then picks the best choice for that narrow set of information.
])


3. _Explain why finding a counterexample is sufficient to prove that an algorithm is incorrect._
#answer([
  A function is correct when, given _any_ input, each input produces the correct output and the function halts. If there exists an input that produces incorrect output, then the function does not produce correct output given any output and is therefore not correct.
])

4. _Why is understanding the growth of functions important when analyzing the time complexity of algorithms?_
#answer([
  Understanding the growth of functions gives insight into the possible resource and time requirements for running the algorithm. This lets us make better decisions on which algorithms to use to solve problems or if it is worth running the algorithm at all.
])

#pagebreak()

5. Suppose that for inputs of size n on a particular computer, insertion sort runs in $8n^2$ steps, and merge sort runs in $64n log n$ steps. For which values of $n$ does insertion sort beat merge sort?
#answer([
  Assuming $log$ is $log_2$,

  $8n^2 & quad >= quad 64 thin n log n, &" where " n = thin ?\
    n^2 & quad >= quad 8 thin n log n, &" where " n = thin ?\
    n & quad >= quad 8 thin log n, &" where " n = thin ?$\

    Trial and error:

    $"Let" n=40: quad & 40 cancel(>=) thick 42.575\
           n=45: quad & 45 >= thick 43.93\
           n=44: quad & 44 >= thick 43.68\
           n=43: quad & 43 cancel(>=) thick 43.41\
    $

    Therefore we choose #h(0.5em) #box(stroke: 0.1em, outset: 0.4em, [$n=44$]) #h(0.5em) .
])

#pagebreak()

= Coding section running time complexity
For the function:
```cpp
int stocks_exhaustive(int prices[], int numPrices)
```
#answer([

As there are two for loops,

$n+(n-1)+(n-2)+...+2+1\
  wide = (n(n+1)/2)\
  wide approx n^2/2$

#box(stroke: 0.1em, outset: 0.4em, [$wide = O(n^2)$])

])

For the function:
```cpp
int stocks_greedy(int prices[], int numPrices)
```
#answer([

As the function simply iterates over the list once,

#box(stroke: 0.1em, outset: 0.4em, [$ = O(n)$])

The greedy solution appears to be #h(0.5em) #box(stroke: 0.1em, outset: 0.4em, [correct])#h(0.5em). It will always terminate given finite input (as it simply iterates over the input), produced correct output given my tests, and I could not find any counterexamples to disprove correctness. However these facts alone is not sufficient to show corretness.
])

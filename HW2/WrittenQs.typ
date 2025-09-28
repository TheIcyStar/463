#set text(size: 13pt)
#set page(
  paper: "us-letter",
  margin: (x: 0.5in, y: 1in),
  header: [
    *Alexander Petrov*
    #h(1fr)
    *CMPSC 463: Homework 2*
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



//////// 1.a
*1.a)* #h(1em) $T(n) = T(n/2)+n^3$
#answer([
  _Guess:_ $T(n) = O(n^3)$

  *B*:\
  Skipped as recommended

  *IH*:\
  Assume $T(n) = O(n^3) = c n^3, quad c > 0, n_0 >= 0, forall n > n_0$

  *IS*:\
  [We will show $T(n/2)+n^3 = c n^3, quad n >= n_0$]
  $
    "LHS" => T(n/2) + n^3 & <= c(n/2)^3 + n^3 &, n >= n_0 & quad (because "IH")\
    & = c n^3/8 + n^3 &, n >= n_0\
    & = c/8 n^3 + n^3 &, n >= n_0\
    & = n^3 (c/8 + 1) &, n >= n_0\
    & = (c/8 + 1) n^3 &, n >= n_0\
    & "Which is RHS."
  $
  $therefore T(n) = O(n^3)$ by mathematical induction and the substitution method #h(1fr) $qed$
])
#pagebreak()



//////// 1.b
*1.b)*  #h(1em) $T(n) = 4T(n/3)+n$
#answer([
  _Guess:_ $T(n) = O(n lg n)$

  *B*:\
  Skipped as recommended

  *IH*:\
  Assume $T(n) = O(n lg n), quad c > 0, n_0 >= 0, forall n > n_0$

  *IS*:\
  [We will show $4T(n/3)+n = c n lg n, quad n >= n_0$]
  $
    "LHS" => 4T(n/3)+n & <= 4(c n/3 lg (n/3)) + n quad &, n >= n_0 & quad (because "IH")\
    & = 4(c/3 n (lg n - lg 3)) &, n >= n_0 &quad (because "logrithm properties")\
    & = (4 c n)/3 (lg n - lg 3) &, n >= n_0\
    & <= (4 c n)/3 (lg n - lg 2) &, n >= n_0 &quad (because lg 3 > lg 2)\
    & = (4 c n)/3 (lg n - 1) &, n >= n_0 &quad (because log_2 2 = 1)\
    & = (4 c)/3 n lg n - (4 c)/3 n &, n >= n_0 &quad (because "simplify")\
    & = (4 c)/3 n lg n &, n >= n_0 &quad (because "remove lower order term")\
    & "Which is RHS."
  $
  $therefore T(n) = O(n lg n)$ by mathematical induction and the substitution method #h(1fr) $qed$
])
#pagebreak()



/////// 2.a
*2.a)*  #h(1em) $T(n) = 5T(n/3)+n lg n$
#answer([
  $a = 5 quad b = 3 quad f(n) = n lg n$\
  Note: $log_3 5 approx 1.46497$

  - Try *Case 1* of the master theorem:
  $
    n lg n quad & ? quad& c n^(1.46497 - epsilon)\
    lg n quad & ? quad& c n^(0.46497 - epsilon) & quad (because "Divide both sides by" n)\
    lg n quad & <= quad& c n^(0.46497 - epsilon) &, quad "pick" epsilon = 0.2\
  $
  $therefore T(n) = Theta(n^(log_3 5)) = Theta(n^1.46497)$ by case 1 of the master theorem.  #h(1fr) $qed$
])



////// 2.b
*2.b)*  #h(1em) $T(n) = 8T(n/2)+n^3 n^(1/2)$
#answer([
  $a = 8 quad b = 2 quad f(n) = n^3 n^(1/2)$\
  Note: $log_2 8 = 3$

  - Try *Case 3* of the master theorem:

  #h(1em) Condition 1:
  $
    n^3 n^(1/2) quad & ? quad& c n^(3 + epsilon)\
    n^(7/2) quad & > quad& c n^(6/2 + epsilon) &, quad "pick" epsilon = 1/4\
  $

  #h(1em) Condition 2:
  $
    8(8T(n/4) + (n^(7/2))/(2^(7/2))) <= 8T(n/2) + n^(7/2)  , quad c in (0,1) "and some large" n
  $


  $therefore T(n) = Theta(n^3 n^(1/2))$ by case 3 of the master theorem.  #h(1fr) $qed$
])
#pagebreak()



////// 2.c
*2.c)*  #h(1em) $T(n) = 8T(n/3)+n^2$
#answer([
  $a = 8 quad b = 3 quad f(n) = n^2$\
  Note: $log_3 8 approx 1.8928$

  - Try *Case 3* of the master theorem:

  #h(1em) Condition 1:
  $
    n^2 quad & > quad& c n^(1.8928 + epsilon) &, quad "pick" epsilon = 0.5
  $

  #h(1em) Condition 2:
  $
    8(8T(n/9) + n^2/9 quad <= quad c n^2 , quad c in (0,1) "and some large" n
  $


  $therefore T(n) = Theta(n^2)$ by case 3 of the master theorem.  #h(1fr) $qed$
])
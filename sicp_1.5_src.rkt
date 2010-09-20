Ben Bitdiddle has invented a test to determine whether the interpreter he is faced with is using applicative-order evaluation or normal-order evaluation. He defines the following two procedures:

(define (p) (p))


(define (test x y)
  (if (= x 0)
      0
      y))

Then he evaluates the expression
(test 0 (p))



If App order then returns 0
If normal order then gets stuck in a look in (define (p)) which is recursive and never breaks the loop


Applicative order (or leftmost innermost) evaluation refers to an evaluation strategy in which the arguments of a function are evaluated from left to right in a post-order traversal of reducible expressions (redexes).
Normal order
Normal-order (or leftmost outermost) evaluation is the evaluation strategy where the outermost redex is always reduced, applying functions before evaluating function arguments. It differs from call-by-name in that call-by-name does not evaluate inside the body of an unapplied function[clarification needed].

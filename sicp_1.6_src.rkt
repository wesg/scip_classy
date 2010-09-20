Welcome to DrRacket, version 5.0 [3m].
Language: racket; memory limit: 128 MB.
> (define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x)
                 x)))
> (define (improve guess x)
  (average guess (/ x guess)))
> (define (average x y)
  (/ (+ x y) 2))
> (define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))
> (define (sqrt x)
  (sqrt-iter 1.0 x))
> (sqrt 9)
. . reference to an identifier before its definition: square
> (square (sqrt 1000))
. . reference to an identifier before its definition: square
> (define (square x) (* x x))
> (sqrt 9)
3.00009155413138
> (sqrt (+ 100 37))
11.704699917758145
> (sqrt (+ (sqrt 2) (sqrt 3)))
1.7739279023207892
> (square (sqrt 1000))
1000.000369924366
> (define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))
> (new-if (= 2 3) 0 5)
5
> (new-if (= 1 1) 0 5)
0
> (define (sqrt-iter guess x)
  (new-if (good-enough? guess x)
          guess
          (sqrt-iter (improve guess x)
                     x)))
> (sqrt 9)

Interactions disabled


Explain:

"To evaluate an if expression, the interpreter starts by evaluating the predicate part of the expression. If the predicate evaluates to a true value, the interpreter then evaluates the consequent and returns its value. Otherwise it evaluates the alternative and returns its value"

(cond (predicate then-clause) (else else-clause))

when (good-enough? guess x) evaluates to true, the interpreter doesn't evaluate the next conditions in version 1
In version 2 with new-if, the parameters "(good-enough? guess x)", "guess" & "(sqrt-iter (improve guess x) x)" are evaluated when being passed to the function. Since "(sqrt-iter (improve guess x) x)" calls sqrt-iter we end up in a recursive loop.


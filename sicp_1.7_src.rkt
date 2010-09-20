Exercise.  

The good-enough? test used in computing square roots will not be very effective for finding the square roots of very small numbers. Also, in real computers, arithmetic operations are almost always performed with limited precision. This makes our test inadequate for very large numbers. 

Explain these statements, with examples showing how the test fails for small and large numbers. 


 (define (sqrt-iter guess x)
 (if (good-enough? guess x)
     guess
     (sqrt-iter (improve guess x)
                x)))
 (define (improve guess x)
 (average guess (/ x guess)))
 (define (average x y)
 (/ (+ x y) 2))
 (define (good-enough? guess x)
 (< (abs (- (square guess) x)) 0.001))
 (define (sqrt x)
 (sqrt-iter 1.0 x))
 (define (square x) (* x x))
 (sqrt 9)

Very Small Examples:
---------------------
> (sqrt 0.0000123)
0.031380962377117995
## Should be 0.0035071355833500363833634934966131

> (sqrt 0.000000000100)
0.03125000106562499
## Should be 0.00001


Explanation: For very small numbers the evaluation within good-enough of the difference being less than 0.001 will be too big.


Very Large Examples:
---------------------
> (sqrt 99999999999999999999999)

## Should be 316227766016.83793319988777330444

For very large numbers 0.001 will be a very small difference and the program will recurse for a long time taking up a lot of memory before coming to an improve guess within range of the actualy sqrt.



An alternative strategy for implementing good-enough? is to watch how guess changes from one iteration to the next and to stop when the change is a very small fraction of the guess. 

Design a square-root procedure that uses this kind of end test. Does this work better for small and large numbers?



(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

Change to:

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) (/ x 10000)))

> (sqrt 0.0000123)
Was: 0.031380962377117995
Now: 0.0035071396311426527
## Should be 0.0035071355833500363833634934966131

> (sqrt 0.000001)
0.0010000001533016628
## Should be: 0.001

> (sqrt 99999999999999999999999)
316228342690.85913



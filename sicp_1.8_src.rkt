Exercise:
Newton's method for cube roots is based on the fact that if y is an approximation to the cube root of x, then a better approximation is given by the value 

x/y^2 + 2y
----------
3

Use this formula to implement a cube-root procedure analogous to the square-root procedure.


Square Root:

 (define (sqrt-iter guess x)
   (if (good-enough? guess x)
       guess
       (sqrt-iter (improve guess x) x)
   )
 )

 (define (improve guess x) (average guess (/ x guess)))

 (define (average x y) (/ (+ x y) 2))
 
 (define (good-enough? guess x) (< (abs (- (square guess) x)) 0.001))
 
 (define (sqrt x) (sqrt-iter 1.0 x))
 
 (define (square x) (* x x))

-------------------------

Cubed Root:

 (define (cbrt-iter guess x)
   (if (good-enough? guess x)
       guess
       (cbrt-iter (improve guess x) x)
   )
 )

 (define (improve guess x) (average (/ x (square guess)) (* 2 guess)))

 (define (average x y) (/ (+ x y) 3))
 
 (define (good-enough? guess x) (< (abs (- (cube guess) x)) 0.001))
 
 (define (cbrt x) (cbrt-iter 1.0 x))
 
 (define (square x) (* x x))

 (define (cube x) (* x x x))


....... Examples .........

Changes to improve: 

# average y + x/y
# average x/y^2 + 2y
# average (+ (square (/ x guess)) (* 2 guess))

 (define (improve guess x) (average guess (/ x guess)))
 to 
 (define (improve guess x) (average (/ x (square guess)) (* 2 guess)))

Changes to good-enough?:
(< (abs (- (square guess) x)) 0.001)
to
(< (abs (- (cube guess) x)) 0.001)


Gotcha's
--------------
D'oh

 (define (improve guess x) (average (/ x (square guess)) (* 2 guess)))

 was 
 
 (define (improve guess x) (average (square (/ x guess)) (* 2 guess)))
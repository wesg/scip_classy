Exercise. Define a procedure that takes three numbers as arguments and returns the sum of the squares of the two larger numbers.

(define (largest x y z)
	(cond	(( and (> x y) (> x z)) x)
		((and (> y x) (> y z)) y)
		(else z)
	)
)

(define (second-largest x y z)
	(cond	((or (and (> x y) (< x z)) (and (< x y) (> x z))) x)
		((or (and (> y x) (< y z)) (and (< y x) (> y z))) y)
		(else z)
	)
)

(define (square x) (* x x))

(define (sum-of-squares x y z) 
						(+ 
						(square (largest x y z)) 
						(square (second-largest x y z))
						) 
)

(sum-of-squares 1 2 3)
(sum-of-squares 3 2 1)
(sum-of-squares 11 10 9)
(sum-of-squares 783 92 0093)
(sum-of-squares 28 23 884)
(sum-of-squares -1 1 2)
(sum-of-squares -10 10 11)




(second-largest 12 11 9)
(second-largest 190 199 19)
(second-largest 1 2 9)
(second-largest 1 -1 5)
(second-largest 99 11 119)
(second-largest 121 111 91)
(second-largest -12 -11 -9)
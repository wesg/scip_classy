Exercise. Observe that our model of evaluation allows for combinations whose operators are compound expressions. Use this observation to describe the behavior of the following procedure:

(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

IF b is negative 
then a plus absolute b ...... becomes ........ a - b ......... i.e. a + (b * -1)
else a plus absolute b  is .......... a + b
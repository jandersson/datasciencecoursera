# question 1
cube <- function(x, n){
  x^3
}
print("Question 1")
print("result of cube(3)")
print(cube(3))

# question 2
print("Question 2")
x <- 1:10
if(x > 5) {
  x <- 0
}
print("This error message indicates 'x' is a vector of length 10 and 'if' can only test a single logical statement.")

# question 3
# function takes x and then adds x to 4 using a function defined within f
f <- function(x) {
  g <- function(y) {
    y + z
  }
  z <- 4
  x + g(x)
}
z <- 10
print("Question 3")
print(f(3))

# question 4
print("Question 4")
x <- 5
y <- if(x < 3) {
  NA
} else {
  10
}
print(y)

#question 5
print("Question 5")
h <- function(x, y = NULL, d = 3L) {
  z <- cbind(x, d)
  if(!is.null(y))
    z <- z + y
  else
    z <- z + f
  g <- x + y / z
  if(d == 3L)
    return(g)
  g <- g + 10
  g
}
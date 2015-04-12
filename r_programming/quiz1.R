x <- 4L
question4 <- class(x)
x <- c(4, "a", TRUE)
question5 <- class(x)
x <- c(1, 3, 5)
y <- c(3, 2, 10)
question6 <- cbind(x, y)
question6
x <- list(2, "a", "b", TRUE)
x[[2]]
x <- 1:4
y <- 2:3
question9 <- x + y

question10 <- c(3, 5, 1, 10, 12, 6)
question10[question10 %in% 1:5] <- 0


x <- 4L
question4 <- class(x)
x <- c(4, "a", TRUE)
question5 <- class(x)
x <- c(1, 3, 5)
y <- c(3, 2, 10)
question6 <- cbind(x, y)
question6
## Question 9
x <- list(2, "a", "b", TRUE)
x[[2]]
x <- 1:4
y <- 2:3
question9 <- x + y
## Question 10
question10 <- c(3, 5, 1, 10, 12, 6)
question10[question10 %in% 1:5] <- 0

## Questions 11-20
# Telling R what data type is in all the column improves loading time for large data sets
data <- read.csv("hw1_data.csv", colClasses="numeric")

# Question 11
print(names(data))

# Question 12
print(data[1:2, ])

# Question 13
print(nrow(data))

#Question 14
print(data[(nrow(data)-1):nrow(data),])

#Question 15
print(data$Ozone[47])

#Question 16
na_values <- is.na(data$Ozone)
print(length(data$Ozone[na_values]))

#Question 17
ozone <- data$Ozone[!na_values]
avg_ozone <- mean(ozone)
print(avg_ozone)

#Question 18
data18 <- data[(data$Ozone > 31) & (data$Temp > 90), ]
good <- complete.cases(data18)
data18_good <- data18[good, ]
print(mean(data18_good$Solar.R))

# Question 19
data19 <- data[data$Month == 6, ]
print(mean(data19$Temp))

# Question 20
data20 <- data[data$Month == 5, ]
data20_good <- data20[complete.cases(data20), ]
print(max(data20_good$Ozone))
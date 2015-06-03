## Question 1
# The R language is a dialect of which of the following programming languages?
print("Question 1: The R language is a dialect of which of the following programming languages?")
print("S")

## Question 2
# The definition of free software consists of four freedoms (freedoms 0 through 3). Which of the following is NOT one of the freedoms that are part of the definition?
print("Question 2: The definition of free software consists of four freedoms (freedoms 0 through 3). Which of the following is NOT one of the freedoms that are part of the definition?")
print("The freedom to prevent users from using the software for undesirable purposes.")

## Question 3
# In R the following are all atomic data types EXCEPT?
print("Question 3: In R the following are all atomic data types EXCEPT")
print("Matrix or table")

## Question 4
# If I execute the expression x <- 4L in R, what is the class of the object `x' as determined by the `class()' function?
print("Question 4: If I execute the expression x <- 4L in R, what is the class of the object `x' as determined by the `class()' function?")
x <- 4L
question4 <- class(x)
print(question4)

## Question 5
# What is the class of the object defined by the expression x <- c(4, "a", TRUE)?
print("Question 5 (x <- c(4, 'a', TRUE)")
x <- c(4, 'a', TRUE)
question5 <- class(x)
print(question5)
print("Question 5: What is the class of the object defined by x <- c(4, TRUE)?")
x <- c(4, TRUE)
question5 <- class(x)
print(question5)
## Question 6
# If I have two vectors x <- c(1,3, 5) and y <- c(3, 2, 10), what is produced by the expression rbind(x, y)?
print("Question 6: If I have two vectors x <- c(1,3, 5) and y <- c(3, 2, 10), what is produced by the expression rbind(x, y)?")
x <- c(1, 3, 5)
y <- c(3, 2, 10)
question6 <- rbind(x, y)
print(question6)

## Question 7
# A key property of vectors in R is that
print("Question 7: A key property of vectors in R is that")
print("elements of a vector all must be of the same class")

## Question 8
# Suppose I have a list defined as x <- list(2, "a", "b", TRUE). 
# What does x[[2]] give me?
x <- list(2, "a", "b", TRUE)
print("Question 8: Suppose I have a list defined as x <- list(2, 'a', 'b', TRUE). What does x[[2]] give me?")
print(x[[2]])
print(class(x[[2]]))
print("Question 8: What does x[[1]] give me?")
print(x[[1]])
print(class(x[[1]]))

## Question 9
# Suppose I have a vector x <- 1:4 and y <- 2:3. 
# What is produced by the expression x + y?
print("Question 9: Suppose I have a vector x <- 1:4 and a vector y <- 2. What is produced by the expression x + y?")
x <- 1:4
y <- 2
question9 <- x + y
print(question9)
print(class(question9))


## Question 10
# Suppose I have a vector x <- c(17, 14, 4, 5, 13, 12, 10) 
# and I want to set all elements of this vector that are greater than 10 to be equal to 4. 
# What R code achieves this?
print("Question 10: Suppose I have a vector x <- c(17, 14, 4, 5, 13, 12, 10) and I want to set all elements of this vector that are greater than 10 to be equal to 4. What R code achieves this?")
x <- c(17, 14, 4, 5, 13, 12, 10)
print(x)
x[x > 10] <- 4
print(x)
print("x[x > 10] <- 4")

## Questions 11-20
# Telling R what data type is in all the column improves loading time for large data sets
data <- read.csv("hw1_data.csv", colClasses="numeric")

# Question 11
print("Question 11")
print(names(data))

# Question 12
print("Question 12: Extract the first 2 rows of the data frame and print them to the console. What does the output look like?")
print(data[1:2, ])

# Question 13
print("Question 13: How many observations (i.e. rows) are in this data frame?")
print(nrow(data))

#Question 14
print("Question 14: Extract the last 2 rows of the data frame and print them to the console. What does the output look like?")
print(data[(nrow(data)-1):nrow(data),])

#Question 15
print("Question 15: What is the value of Ozone in the 47th row?")
print(data$Ozone[47])

#Question 16
print("Question 16: How many missing values are in the Ozone column of this data frame?")
na_values <- is.na(data$Ozone)
print(length(data$Ozone[na_values]))

#Question 17
print("Question 17: What is the mean of the Ozone column in this dataset? Exclude missing values (coded as NA) from this calculation.")
ozone <- data$Ozone[!na_values]
avg_ozone <- mean(ozone)
print(avg_ozone)

#Question 18
print("Question 18: Extract the subset of rows of the data frame where Ozone values are above 31 and Temp values are above 90. What is the mean of Solar.R in this subset?")
data18 <- data[(data$Ozone > 31) & (data$Temp > 90), ]
good <- complete.cases(data18)
data18_good <- data18[good, ]
print(mean(data18_good$Solar.R))

# Question 19
print("Question 19: What is the mean of 'Temp' when 'Month' is equal to 6?")
data19 <- data[data$Month == 6, ]
print(mean(data19$Temp))

# Question 20
print("Question 20: What was the maximum ozone value in the month of May (i.e. Month = 5)?")
data20 <- data[data$Month == 5, ]
data20_good <- data20[complete.cases(data20), ]
print(max(data20_good$Ozone))
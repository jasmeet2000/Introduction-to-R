# Memory allocation
# Eg.:- Try to avoid use for loop 
1:10

#-----------------------------------------------------------
#Timings - growing a vector

n <- 30000
# Slow code
growing <- function(n) {
  x <- NULL
  for(i in 1:n)
    x <- c(x, rnorm(1))
  x
}

# Use <- with system.time() to store the result as res_grow
system.time(res_grow <- growing(n = 30000))
#------------------------------------------------------------
# Timings - pre-allocation

# Fast code
pre_allocate <- function(n) {
  x <- numeric(n) # Pre-allocate
  for(i in 1:n) 
    x[i] <- rnorm(1)
  x
}
# Use <- with system.time() to store the result as res_allocate
n <- 30000
system.time( res_allocate <- pre_allocate(n))
#_______________________________________________________________________________
# Vectorized code: multiplication
x <- rnorm(10)
x2 <- numeric(length(x))
for(i in 1:10)
  x2[i] <- x[i] * x[i]

# Rewrite that code using a vectorized solution.
x2_imp <- x * x
x2_imp

#---------------------------------------------------------------
# Vectorized code: calculating a log-sum

# Initial code
n <- 100
total <- 0
x <- runif(n)
for(i in 1:n) 
  total <- total + log(x[i])

# Rewrite in a single line. Store the result in log_sum
log_sum <- sum(log(x))
#_______________________________________________________________________________
# Data frames and matrices - column selection
# All values in a matrix must have the same data type, which has efficiency 
# implications when selecting rows and columns.
# Suppose we have two objects, mat (a matrix) and df (a data frame).
# Which is faster, mat[, 1] or df[, 1]? 
microbenchmark(mat[, 1], df[, 1])

# What does selecting a row in a data frame return?
# A Data Frame

# Which is faster, mat[1, ] or df[1, ]? 
microbenchmark(mat[1, ], df[1, ])

# Interesting! Accessing a row of a data frame is much slower than accessing 
# that of a matrix, more so than when accessing a column from each data type. 
# This is because the values of a column of a data frame must be the same data type,
# whereas that of a row doesn't have to be. Do you see the pattern here?

#___________________________________________________________________________________


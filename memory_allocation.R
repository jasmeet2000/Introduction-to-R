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
# What is code profiling
# How does profvis profile a function?
# It records the call stack at regular intervals.
#------------------------------------------------------------------
# Load the data set
data(movies, package = "ggplot2movies") 

# Load the profvis package
library("profvis")

# Profile the following code with the profvis function
profvis({
    # Load and select data
    comedies <- movies[movies$Comedy == 1, ]
    
    # Plot data of interest
    plot(comedies$year, comedies$rating)
    
    # Loess regression line
    model <- loess(rating ~ year, data = comedies)
    j <- order(comedies$year)
    
    # Add fitted line to the plot
    lines(comedies$year[j], model$fitted[j], col = "red")
  }) 
## Remember the closing brackets!
#_______________________________________________________________________________
# Profvis: Larger example

# Load the microbenchmark package
library("microbenchmark")

# Change the data frame to a matrix
# One of the parts of the code that profvis highlighted was the line where we 
# generated the possible dice rolls and stored the results in a data frame:
  
# The previous data frame solution is defined
# d() Simulates 6 dices rolls
d <- function() {
  data.frame(
    d1 = sample(1:6, 3, replace = TRUE),
    d2 = sample(1:6, 3, replace = TRUE)
  )
}
# We can optimize this code by making two improvements:
  
# Switching from a data frame to a matrix
# Generating the 6 dice rolls in a single step
# This gives

m <- function() {
  matrix(sample(1:6, 6, replace = TRUE), ncol = 2)
}

# Use microbenchmark to time m() and d()
microbenchmark(
  data.frame_solution = d(),
  matrix_solution     = m()
)
#-------------------------------------------------------------------------------
# Example data
rolls <- matrix(1:6, nrow = 3, ncol = 2)

# Define the previous solution 
app <- function(x) {
  apply(x, 1, sum)
}

# Define the new solution
r_sum <- function(x) {
  rowSums(x)
}

# Compare the methods
microbenchmark(
  app_sol = app(rolls),
  r_sum_sol = r_sum(rolls)
)
#-------------------------------------------------------------------------------
# Use && instead of &

is_double <- c(FALSE, TRUE, TRUE)
is_double

# Define the previous solution
move <- function(is_double) {
  if (is_double[1] & is_double[2] & is_double[3]) {
    current <- 11 # Go To Jail
  }
}

# Define the improved solution
improved_move <- function(is_double) {
  if (is_double[1] && is_double[2] && is_double[3]) {
    current <- 11 # Go To Jail
  }
}

# microbenchmark both solutions
# Very occassionally the improved solution is actually a little slower
# This is just random chance
microbenchmark(improved_move, move, times = 1e5)




# Writing Efficient r code

# Print the R version details using version
version

# Assign the variable major to the major component
major <- version$major
major

# Assign the variable minor to the minor component
minor <- version$minor
minor

#Benchmarking in R

# 1. We construct a function around the feature we wish to benchmark
# 2. We time the function under different scenario, eg., data-set

#-----------------------------------------------------------------------
#Example
# Comparing read times of CSV and RDS files
# How long does it take to read movies from CSV?
system.time(read.csv("movies.csv"))

# How long does it take to read movies from RDS?
system.time(readRDS("movies.rds"))

#-----------------------------------------------------------------------
# There are a number of ways to assign variables to objects. The two standard ways
# are to use the = or <- operators. Which of the following statements is true?
# Ans:- Using the <- operator inside a function call will create a new (or overwrite 
                                                                # an existing) object.


#-----------------------------------------------------------------------
# The microbenchmark() function makes it easier to compare multiple function calls
# at once by compiling all the relevant information in a data frame. It does this
# by running each function call multiple times, recording the time it took for the
# function to run each time, then computing summary statistics for each expression
# as you can see here.

# Load the microbenchmark package
library(microbenchmark)

# Compare the two functions
compare <- microbenchmark(read.csv("movies.csv"), 
                          readRDS("movies.rds"), 
                          times = 10)

# Print compare
compare

# the mean time of read.csv() compared to readRDS() is 9 times slower 

#____________________________________________
vectors <- list(
  A = c(9, 1, NA, 4, 3),
  B = c(7,  NA,  4,  4,  1,  NA, 10,  8)
)

convert_to_seconds <- 
  function
(minutes) {
  seconds = minutes * 60
  cat(seconds, " seconds")
}

convert_to_seconds(33)
#_______________________________________


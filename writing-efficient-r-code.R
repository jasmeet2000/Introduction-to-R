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

















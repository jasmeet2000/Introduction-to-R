# The apply family

# There are three type of apply family:-
# 1. lapply
# 2. sapply
# 3. vapply
#  The common thing is that, they all apply function over list or vector
#  The difference is in the output of each apply function


# lapply

# The lapply function applies a function to a list or a vector, returning a list
# of the same length as the input.
  
# lapply() function is useful for performing operations on list objects and returns
# a list object of same length of original set. lappy() returns a list of the similar
# length as input list object, each element of which is the result of applying FUN to
# the corresponding element of list. Lapply in R takes list, vector or data frame as
# input and gives output in list.
# The syntax of the function is as follows:

# lapply function syntax:-
lapply(X,   # List or vector
       FUN, # Function to be applied
       ...) # Additional arguments to be passed to FUN

# lapply always return list (output is list)
#--------------------------------------------------------------
#For Example:-
cities <- c("Jalandhar", "Delhi", "Hyd")

lapply(cities,nchar)

unlist(lapply(cities,nchar))
# _________________________________________________________________________________
# Example of lapply:-

# The vector pioneers has already been created for you
pioneers <- c("GAUSS:1777", "BAYES:1702", "PASCAL:1623", "PEARSON:1857")

# Split names from birth year
split_math <- strsplit(pioneers, split = ":")

# Convert to lowercase strings: split_low
split_low <- lapply(split_math,tolower)
split_low
# Take a look at the structure of split_low
str(split_low)


# __________________________________________________________________________________
# Code from previous exercise:
pioneers <- c("GAUSS:1777", "BAYES:1702", "PASCAL:1623", "PEARSON:1857")
split <- strsplit(pioneers, split = ":")
split_low <- lapply(split, tolower)

# Write function select_first()
select_first <- function(x) {
  x[1]
}

# Apply select_first() over split_low: names
names <- lapply(split_low, select_first)

# Write function select_second()
select_second <- function(x) {
  x[2]
}


# Apply select_second() over split_low: years
years <- lapply(split_low, select_second)
#_______________________________________________________________________________
# split_low has been created for you
split_low

# Transform: use anonymous function inside lapply

names <- lapply(split_low, function(x) { x[1] }) 

unlist(names)
# Transform: use anonymous function inside lapply

years <- lapply(split_low, function(x) { x[2] })
unlist(years)
#_______________________________________________________________________________
# Generic select function (Dynamic function)
select_el <- function(x, index) {
  x[index]
}

# Use lapply() twice on split_low: names and years
names <- lapply(split_low,select_el,index=1)
years <- lapply(split_low,select_el,index=2)
unlist(names)
unlist(years)



#_______________________________________________________________________________
# sapply

# sapply() function takes list, vector or data frame as input and gives output in 
# vector or matrix. It is useful for operations on list objects and returns a list
# object of same length of original set. Sapply function in R does the same job as
# lapply() function but returns a vector.

sapply(X, FUN)
# Arguments:
#     - X   : A vector or an object
#     - FUN : Function applied to each element of x

# output is array (which is simplify list to array), it can be obtained by
# unlist(lapply) or by directly using  sapply()

#_______________________________________________________________________________
#EXAMPLE (with build in functionn):-
#temperature 
temp <- list(50:54,40:45,45:50)


# Use lapply() to find each day's minimum temperature
# built-in function min()
lapply_min_temp <- lapply(temp,min)
lapply_min_temp
unlist(lapply_min_temp)
#---  ----  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---
# Use sapply() to find each day's minimum temperature
sapply_min_temp <- sapply(temp, min)
sapply_min_temp

#----------------------------------------------------------
# Use lapply() to find each day's maximum temperature
# built-in function max()
lapply_min_temp <- lapply(temp,max)
lapply_min_temp
unlist(lapply_min_temp)
#---  ----  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---
# Use sapply() to find each day's maximum temperature
sapply_min_temp <- sapply(temp, max)
sapply_min_temp

#-----------------------------------------------------------------------------
#EXAMPLE (with user define in functionn):-
#temperature 
temp <- list(50:54,40:45,45:50)

# Finish function definition of extremes_avg
extremes_avg <- function(x) {
  ( min(x) + max(x) ) / 2
}

# Apply extremes_avg() over temp using sapply()
sapply(temp,extremes_avg)

# Apply extremes_avg() over temp using lapply()
lapply(temp,extremes_avg)

#-----------------------------------------------------------------------------
# Example of sapply() with function returning vector
#temperature 
temp <- list(50:54,40:45,45:50)

# Create a function that returns min and max of a vector: extremes
extremes <- function(x) {
  c(min = min(x), max = max(x) )
}

# Apply extremes() over temp with lapply()
lapply(temp,extremes)

# Apply extremes() over temp with sapply()
sapply(temp,extremes)
#-----------------------------------------------------------------------------

#temperature 
temp <- list(-1:5,0:6,-2:4,1:5)

# Definition of below_zero()
below_zero <- function(x) {
  return(x[x < 0])
}

# Apply below_zero over temp using sapply(): freezing_s
freezing_s <- sapply(temp,below_zero)

# Apply below_zero over temp using lapply(): freezing_l
freezing_l <- lapply(temp,below_zero)

# Are freezing_s and freezing_l identical?
identical(freezing_s,freezing_l)
#-----------------------------------------------------------------------------
# sapply with functions that return NULL

# sapply() reacts when it is used to apply a function that returns NULL over a 
# vector or a list.

# temp is already available in the workspace
temp <- list(-1:5,0:6,-2:4,1:5)

# Definition of print_info()
print_info <- function(x) {
  cat("The average temperature is", mean(x), "\n")
}

# Apply print_info() over temp using sapply()
s <- sapply(temp,print_info)

# Apply print_info() over temp using lapply()
l <- lapply(temp,print_info)

identical(l,s)


#_______________________________________________________________________________

#vapply


#____  ____  ____
# EXAMPLE

temp <- list(50:54,40:45,45:50)

# Definition of basics()
basics <- function(x) {
  c(min = min(x), mean = mean(x), max = max(x))
}

# Apply basics() over temp using vapply()
vapply(temp,basics,numeric(3))

#updated basic function
basics <- function(x) {
  c(min = min(x), mean = mean(x), median = median(x), max = max(x))
}

# The error is in 3 
vapply(temp, basics, numeric(4))
#_______________________________________________________________________________
# From sapply to vapply
temp <- list(50:54,40:45,45:50)

# Convert to vapply() expression
sapply(temp, max)

vapply(temp, max,numeric(1))

# Convert to vapply() expression
sapply(temp, function(x, y) { mean(x) > y }, y = 5)

vapply(temp, function(x, y) { mean(x) > y }, y = 5, logical(1))





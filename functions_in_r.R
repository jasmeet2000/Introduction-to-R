# Functions

# In-build Function
# Consult the documentation on the mean() function
help(mean)
?mean
# Inspect the arguments of the mean() function
args(mean)

# __________________________________________________________________________
#EXAMPLE of user define function
# The linkedin and facebook vectors have already been created for you
linkedin <- c(16, 9, 13, 5, 2, 17, 14)
facebook <- c(17, 7, 5, 16, 8, 13, 14)

# Calculate the mean of the sum
avg_li <- mean(linkedin)
avg_fb <- mean(facebook)
avg_sum <- avg_li + avg_fb 

# Calculate the trimmed mean of the sum
avg_sum_trimmed <- mean(avg_sum, trim=0.2)

# Inspect both new variables
avg_sum
avg_sum_trimmed

#----------------------------------
# The linkedin and facebook vectors have already been created for you
linkedin <- c(16, 9, 13, 5, NA, 17, 14)
facebook <- c(17, NA, 5, 16, 8, 13, 14)

# Calculate the mean absolute deviation
mean(abs(linkedin - facebook), na.rm=TRUE)

#____________________________________________________________________________
#User Define Function:-

# An R function is created by using the keyword function. 
# The basic syntax of an R function definition is as follows −
function_name <- function(arg_1, arg_2, ...) {
  #Function body 
}


#Example
# Create a function
new_function <- function(a) {
  for(i in 1:a) {
    b <- i^2
    print(b)
  }
}

# Calling Function
new_function(2)

args(new_function)

#____________________________________________________________________________

# Create a function pow_two()
pow_two <- function(arg){
  return (arg^2)
}

# Use the function
pow_two(12)

# Create a function sum_abs()
sum_abs <- function(arg_one,arg_two){
  abs(arg_one) + abs(arg_two)  
}


# Use the function
sum_abs(-2,3)
# _________________________________________________________________________
# Define the function hello()
hello <- function(){
  print("Hi there!")
  return(TRUE)
}

# Call the function hello()
hello()
#______________________________________________________________________________
# Finish the pow_two() function
pow_two <- function(x, print_info=TRUE) {
  y <- x ^ 2
  if(print_info){
    print(paste(x, "to the power two equals", y))
  }
  return(y)
}

pow_two(4)
pow_two(4, FALSE)
#______________________________________________________________________
# Load an R Package

# installs a given package.
install.packages("ggvis")

# library() which loads packages, i.e. attaches them to the search list on your R workspace.
library(ggvis)

require(ggvis)

#search(), to look at the currently attached packages
search()

#_______________________________________________________________________________
# Note the arguments to median()
args(median)

#_______________________________________________________________________________
coin_sides <- c("head", "tail")

# Sample from coin_sides once
sample <- function(x, size, replace = FALSE, prob = NULL) 
{
  if (length(x) == 1L && is.numeric(x) && is.finite(x) && x >= 
      1) {
    if (missing(size)) 
      size <- x
    sample.int(x, size, replace, prob)
  }
  else {
    if (missing(size)) 
      size <- length(x)
    x[sample.int(length(x), size, replace, prob)]
  }
}

sample(coin_sides,size=1)

# From previous steps
toss_coin <- function() {
  coin_sides <- c("head", "tail")
  sample(coin_sides, 1)
}

# Call the function
toss_coin()
#_______________________________________________________________________________
# Update the function to return n coin tosses
toss_coin <- function(n_flips) {
  coin_sides <- c("head", "tail")
  sample(coin_sides, n_flips,replace = TRUE)
}

# Generate 10 coin tosses
toss_coin(n_flips=10)







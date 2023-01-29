# Conditional Statements
# if statement
if (condition) {
  expr
}

# Example
x <- -3
if (x < 0) {
  print("x is a negative number")
}else{
  print("x is a + number")
}
#-------------------------------------------------
#else if statement
if (condition1) {
  expr1
} else if (condition2) {
  expr2
} else {
  expr3
}

# Example
x <- -3
if (x < 0) {
  print("x is a negative number")
} else if (x == 0) {
  print("x is zero")
} else {
  print("x is a positive number")
}
#______________________________________________________
#EXAMPLE
# Variables related to your last day of recordings
medium <- "LinkedIn"
num_views <- 14

# Examine the if statement for medium
if (medium == "LinkedIn") {
  print("Showing LinkedIn information")
} else if (medium == "Facebook") {
  # Add code to print correct string when condition is TRUE
  print("Showing Facebook information")
} else {
  print("Unknown medium")
}

# statement that prints "You are popular!" to the console if the num_views variable exceeds 15.
if (num_views > 15) {
  print("You're popular!")
} else if (num_views <= 15 & num_views > 10) {
  # Add code to print correct string when condition is TRUE
  print("Your number of views is average")
} else {
  print("Try to be more visible!")
}
#_________________________________________________________________
# Variables related to your last day of recordings
li <- 15
fb <- 9

# Code the control-flow construct
if (li > 15 & fb > 15) {
  sms <- 2 * (li + fb)
} else if (li < 10 & fb < 10) {
  sms <- 0.5 * (li + fb)
} else {
  sms <- li + fb
}

# Print the resulting sms to the console
sms
#_____________________________________________________________________________________________
# While loop
while (test_expression)
{
  statement
}

# A break statement is used inside a loop (repeat, for, while) to stop the iterations and flow
# the control outside of the loop.
while (test_expression)
{
  if (test_expression) {
    break
  }
}
#EXAMPLE
# Initialize the speed variable
speed <- 64
count <- 0

# Code the while loop
while (speed > 30) {
  print("Slow down!")
  speed <- speed - 7
  count <- count + 1
}

# Print out the speed variable
speed
count
#_______________________________________________________________________
# Initialize the speed variable
speed <- 88

while (speed > 30) {
  print(paste("Your speed is", speed))
  
  # Break the while loop when speed exceeds 80
  if (speed > 80 ) {
    break
  }
  
  if (speed > 48) {
    print("Slow down big time!")
    speed <- speed - 11
  } else {
    print("Slow down!")
    speed <- speed - 6
  }
}
#_______________________________________
# Finish the while loop so that it:
# prints out the triple of i, so 3 * i, at each run.
# is abandoned with a break if the triple of i is divisible by 8,
# but still prints out this triple before breaking.
# Initialize i as 1 
i <- 1

# Code the while loop
while (i <= 10) {
  print(i * 3)
  if (i * 3 %% 8 == 0) {
    break
  }
  i <- i + 1
}
#______________________________________________________________________________
# For loop
for (val in sequence)
{
  statement
}

# Here, sequence is a vector and val takes on each of its value during the loop.
# In each iteration, statement is evaluated.
#-------------------------------------------------------
# Loop over a vector
# The linkedin vector has already been defined for you
linkedin <- c(16, 9, 13, 5, 2, 17, 14)

# Loop version 1
for (lk in linkedin) {
  print(lk)
}

# Loop version 2
for (i in 1:length(linkedin)) {
  print(linkedin[i])
}

#---------------------------------------------------
# Loop over a list
# The nyc list is already specified
nyc <- list(pop = 8405837, 
            boroughs = c("Manhattan", "Bronx", "Brooklyn", "Queens", "Staten Island"), 
            capital = FALSE)

# Loop version 1
for (n in nyc) {
  print(n)
}



# Loop version 2
for (i in 1:length(nyc)) {
  print(nyc[[i]])
}
#---------------------------------------------------
# Loop over a matrix
#been defined for you

vector<-c("O",  NA  , "X" ,NA,   "O",  "O" ,"X",  NA,"X")

ttt<-matrix(vector,nrow=3,ncol =3)
ttt

# define the double for loop
for (i in 1:nrow(ttt)) {
  for (j in 1:ncol(ttt)) {
    print(paste("On row", i , "and column", j, 
                "the board contains", ttt[i,j]))
  }
}
#-----------------------------------------------------------
# We will use the break and next statements:
#   
# The break statement abandons the active loop: the remaining code in the loop is skipped 
# and the loop is not iterated over anymore.
# The next statement skips the remainder of the code in the loop, but continues the iteration.

# The linkedin vector has already been defined for you
linkedin <- c(16, 9, 13, 5, 2, 17, 14)

# Adapt/extend the for loop
for (li in linkedin) {
  if (li > 10) {
    print("You're popular!")
  } else {
    print("Be more visible!")
  }
  
  # Add if statement with break
  if(li > 16){
    print( "This is ridiculous, I'm outta here!")
    break
  }
  
  # Add if statement with next
  if(li< 5 ){
    print("This is too embarrassing!")
    next
  }
  
  print(li)
}
#------------------------------------------------------------------------------

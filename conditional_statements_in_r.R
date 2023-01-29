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
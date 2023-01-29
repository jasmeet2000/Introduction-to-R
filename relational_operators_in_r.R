# Relational Operators

c <- "Hello"
d <- "Jassi"
#Equality 
c == d
# ______________________________________________
#In-Equality 
c != d
# _______________________________________________
#Less than or greater then
a <- 10
b <- 20

a < b
b < a
# _______________________________________________
# Relational operators
# <= and >=
c <- 10
c >= a
c<= b

# ________________________________________________
# Relational operators with vectors
linkedin <- c(16,9,4,5,8,10)
linkedin

linkedin > 10

# Vector with vectors Relational operators
facebook <- c(51,20,30,50,100,40)
facebook

facebook <= linkedin
#___________________________________________________
# EXAMPLE
# Comparison of logicals
TRUE == FALSE

# Comparison of numerics
(-6 * 14) != (17 - 101)

# Comparison of character strings
"useR" == "user" 

# Compare a logical with a numeric
TRUE == 1

# Comparison of numerics
-6 * 5 + 2 >= -10 + 1

# Comparison of character strings
"raining" <= "raining dogs"

# Comparison of logicals
TRUE > FALSE

#___________________________________________________
# The linkedin and facebook vectors have already been created for you
linkedin <- c(16, 9, 13, 5, 2, 17, 14)
facebook <- c(17, 7, 5, 16, 8, 13, 14)
views <- matrix(c(linkedin, facebook), nrow = 2, byrow = TRUE)

# On which days did the number of LinkedIn profile views exceed 15?
linkedin > 15

#When was your LinkedIn profile viewed only 5 times or fewer?
linkedin <= 5 

# When was your LinkedIn profile visited more often than your Facebook profile?
linkedin > facebook

# When were the views exactly equal to 13? Use the views matrix to return a logical matrix.
views == 13

# For which days were the number of views less than or equal to 14? Again, have R return a 
# logical matrix.
views <= 14

# Lists
# A list in R is similar to your to-do list at work or school: the different items on that list 
# most likely differ in length, characteristic, and type of activity that has to be done.
# 
# A list in R allows you to gather a variety of objects under one name (that is, the name of the list)
# in an ordered way. These objects can be matrices, vectors, data frames, even other lists, etc. It is
# not even required that these objects are related to each other in any way.
# 
# You could say that a list is some kind super data type: you can store practically any piece of 
# information in it!

#List()
# Vector with numerics from 1 up to 10
my_vector <- 1:10 

# Matrix with numerics from 1 up to 9
my_matrix <- matrix(1:9, ncol = 3)

# First 10 elements of the built-in data frame mtcars
my_df <- mtcars[1:10,]

# Adapt list() call to give the components names
my_list <- list(vec = my_vector, mat = my_matrix,df = my_df)

# Print out my_list
my_list

# Print out the list from vec
my_list$vec

# or  Print out the list from vec with second element
my_list$vec[2]
# ________________________________________________________________________________
#EXAMPLE

# Use the table from the exercise to define the comments and scores vectors
scores <- c(4.6, 5, 4.8, 5, 4.2)
comments <- c("I would watch it again", "Amazing!", "I liked it", "One of the best movies", "Fascinating plot") 

# Save the average of the scores vector as avg_review
avg_review <- mean(scores)

# Combine scores and comments into the reviews_df data frame
reviews_df <- data.frame(scores, comments)

# Create and print out a list, called departed_list
departed_list <- list(movie_title, movie_actors, reviews_df, avg_review)
departed_list

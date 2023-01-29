# Matrix
# In R, a matrix is a collection of elements of the same data type 
# (numeric, character, or logical) arranged into a fixed number of rows and
# columns. Since we are only working with rows and columns, a matrix is 
# called two-dimensional.

# We can construct a matrix in R with the matrix() function.

# Construct a matrix with 3 rows that contain the numbers 1 up to 9
matrix(1:9, byrow = TRUE, nrow = 3)

#______________________________________________________________________

matrix <- matrix(1:9, byrow = TRUE, nrow = 3)


# Box office Star Wars (in millions!)
new_hope <- c(460.998, 314.4)
empire_strikes <- c(290.475, 247.900)
return_jedi <- c(309.306, 165.8)

# Construct star_wars_matrix
box_office <- c(460.998, 314.4, 290.475, 247.900, 309.306, 165.8)
region <- c("US", "non-US")
titles <- c("A New Hope", 
            "The Empire Strikes Back", 
            "Return of the Jedi")

star_wars_matrix <- matrix(box_office, 
                           nrow = 3, byrow = TRUE,
                           dimnames = list(titles, region))

box_office2 <- c(474.5, 314.4, 310.7, 552.5, 380.3, 468.5)
titles <- c("The Phantom Menace", 
            "Attack of the Clones", 
            "Revenge of the Sith")
star_wars_matrix2 <- matrix(box_office2, 
                           nrow = 3, byrow = TRUE,
                           dimnames = list(titles, region))

# The worldwide box office figures
worldwide_vector <- rowSums(star_wars_matrix)

# Bind the new variable worldwide_vector as a column to star_wars_matrix
all_wars_matrix <- cbind(star_wars_matrix,worldwide_vector)

# Combine both Star Wars trilogies in one matrix
# star_wars_matrix2 same as star_wars_matrix
all_wars_matrix <- rbind(star_wars_matrix,star_wars_matrix2)

# Total revenue for US and non-US
total_revenue_vector <- colSums(all_wars_matrix)

# Print out total_revenue_vector
total_revenue_vector

# _________________________________________________________________________
# Selection of matrix elements

# all_wars_matrix is available in your workspace
all_wars_matrix

# Select the non-US revenue for all movies
non_us_all <- all_wars_matrix[,2]

# Average non-US revenue
mean(non_us_all)

# Select the non-US revenue for first two movies
non_us_some <- all_wars_matrix[1:2,2]

# Average non-US revenue for first two movies
mean(non_us_some)

# Estimate the visitors
visitors <- all_wars_matrix / 5

# Print the estimate to the console
visitors

#3D matrix
vector1 <- c(5, 9, 3,9)
vector2 <- c(10, 11,2,7)
column.names <- c("COL1", "COL2")
row.names <- c("ROW1", "ROW2")
matrix.names <- c("Matrix1", "Matrix2")

# Take these vectors as input to the array.
result <- array(c(vector1, vector2), dim = c(2, 2, 2,2),
                dimnames = list(row.names, column.names,
                                matrix.names))
result

#How to access 3d matrix
result[,2,2]  
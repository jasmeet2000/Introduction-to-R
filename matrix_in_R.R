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
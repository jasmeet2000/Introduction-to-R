# Useful Functions
abs()
round()
sum()
mean()
c()
seq() #: Generate sequences, by specifying the from, to, and by arguments.
rep() #: Replicate elements of vectors and lists.
sort()#: Sort a vector in ascending order. Works on numerics, but also on character strings and logicals.
rev() #: Reverse the elements in a data structures for which reversal is defined.
str() #: Display the structure of any R object.
append() #: Merge vectors or lists.
#is.*(): Check for the class of an R object.
#as.*(): Convert an R object from one class to another.
#unlist(): Flatten (possibly embedded) lists to produce a vector.

#__________________________________________________________

#EXAMPLE
# the order of operations is as follow:-
# The errors vector has already been defined for you
errors <- c(1.9, -2.6, 4.0, -9.5, -3.4, 7.3)

# Sum of absolute rounded values of errors
round(mean(sum(abs(errors))))
#__________________________________________________________
# Don't edit these two lines
vec1 <- c(1.5, 2.5, 8.4, 3.7, 6.3)
vec2 <- rev(vec1)

mean(c(abs(vec1), abs(vec2)))
#__________________________________________________________
# The linkedin and facebook lists have already been created for you
linkedin <- list(16, 9, 13, 5, 2, 17, 14)
facebook <- list(17, 7, 5, 16, 8, 13, 14)

# Convert linkedin and facebook to a vector: li_vec and fb_vec
li_vec <- unlist(linkedin)
fb_vec <- unlist(facebook)

#class(li_vec)
# Append fb_vec to li_vec: social_vec
social_vec <- append(li_vec,fb_vec)

# Sort social_vec
sort(social_vec,decreasing = TRUE)
#_______________________________________________________________________
# uses the functions rep() and seq().
# Create first sequence: seq1
seq1 <- seq(from = 1, to = 500, by = 3)

# Create second sequence: seq2
seq2 <- seq(from= 1200, to=900, by=-7)

# Calculate total sum of the sequences
sum(seq1) + sum(seq2)
rep(seq(1, 7, by = 2), times = 7)
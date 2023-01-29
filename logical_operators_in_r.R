# Logical Operators:-

# 1. AND operator &
# 2. OR operator |
# 3. NOT operator ! 
# 4. & (return a multipal Boolean value) vs && (return a single Boolean value)
# 5. | (return a multipal Boolean value) vs || (return a single Boolean value)

#______________________________________________________________________________
#EXAMPLE
# The linkedin and last variable are already defined for you
linkedin <- c(16, 9, 13, 5, 2, 17, 14)
last <- tail(linkedin, 1)

# Is last under 5 or above 10?
last > 5 | last < 10

# Is last between 15 (exclusive) and 20 (inclusive)?
last >15 & last<= 20
#_______________________________________________________________________________

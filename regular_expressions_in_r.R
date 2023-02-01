# Regular Expressions
?regex

grepl()
sub()
gsub()
#_______________________________________________________________________________
#EXAMPLE

# The emails vector has already been defined for you
emails <- c("john.doe@ivyleague.edu", "education@world.gov", "dalai.lama@peace.org",
            "invalid.edu", "quant@bigdatacollege.edu", "cookie.monster@sesame.tv")

# Use grepl() to match for "edu"
grepl("edu", emails)

# Use grep() to match for "edu", save result to hits
hits <- grep("edu", emails)
hits

# Subset emails using hits
emails[hits]
#________________________________________________________________________________
# You can use the caret, ^, and the dollar sign, $ to match the content located in
# the start and end of a string, respectively. This could take us one step closer 
# to a correct pattern for matching only the ".edu" email addresses from our list 
# of emails. But there's more that can be added to make the pattern more robust:

#  @, because a valid email must contain an at-sign.
#  .*, which matches any character (.) zero or more times (*). Both the dot and the
#  asterisk are metacharacters. You can use them to match any character between the
#  at-sign and the ".edu" portion of an email address.
#  \\.edu$, to match the ".edu" part of the email at the end of the string. The \\ 
#  part escapes the dot: it tells R that you want to use the . as an actual character.

# The emails vector has already been defined for you
emails <- c("john.doe@ivyleague.edu", "education@world.gov", "dalai.lama@peace.org",
            "invalid.edu", "quant@bigdatacollege.edu", "cookie.monster@sesame.tv")

# Use grepl() to match for .edu addresses more robustly
grepl("@.*\\.edu$", emails)
# Use grep() to match for .edu addresses more robustly, save result to hits
hits <- grep("@.*\\.edu$", emails)
# Subset emails using hits
emails[hits]
#_________________________________________________________________________________
# sub
# While grep() and grepl() were used to simply check whether a regular expression 
# could be matched with a character vector, sub() and gsub() take it one step 
# further: you can specify a replacement argument. If inside the character vector 
# x, the regular expression pattern is found, the matching element(s) will be 
# replaced with replacement. sub() only replaces the first match, whereas gsub() 
# replaces all matches.

# The emails vector has already been defined for you
emails <- c("john.doe@ivyleague.edu", "education@world.gov", "global@peace.org",
            "invalid.edu", "quant@bigdatacollege.edu", "cookie.monster@sesame.tv")

# Use sub() to convert the email domains to datacamp.edu
sub("@.*\\.edu$", "@datacamp.edu", emails)
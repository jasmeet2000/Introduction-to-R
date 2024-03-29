#factors
# The term factor refers to a statistical data type used to store categorical variables. 
# The difference between a categorical variable and a continuous variable is that a categorical
# variable can belong to a limited number of categories. A continuous variable, on the other hand,
# can correspond to an infinite number of values.

# It is important that R knows whether it is dealing with a continuous or a categorical variable, 
# as the statistical models you will develop in the future treat both types differently.
# (You will see later why this is the case.)

# A good example of a categorical variable is sex. In many circumstances you can limit the sex 
# categories to "Male" or "Female". (Sometimes you may need different categories. For example, 
# you may need to consider chromosomal variation, hermaphroditic animals, or different cultural norms,
# but you will always have a finite number of categories.)

# _________________________________________________________________________________________

# Sex vector
sex_vector <- c("Male", "Female", "Female", "Male", "Male")

# Convert sex_vector to a factor
factor_sex_vector <- factor(sex_vector)

# Print out factor_sex_vector
factor_sex_vector

# ________________________________________________________________________________________

# Animals
animals_vector <- c("Elephant", "Giraffe", "Donkey", "Horse")
factor_animals_vector <- factor(animals_vector)
factor_animals_vector

# Temperature
temperature_vector <- c("High", "Low", "High","Low", "Medium")
factor_temperature_vector <- factor(temperature_vector, order = TRUE, levels = c("Low", "Medium", "High"))
factor_temperature_vector

# Code to build factor_survey_vector
survey_vector <- c("M", "F", "F", "M", "M")
factor_survey_vector <- factor(survey_vector)

# Specify the levels of factor_survey_vector
levels(factor_survey_vector) <- c("Female", "Male")

factor_survey_vector

# _________________________________________________________________________________________

# Generate summary for survey_vector
summary(survey_vector)

# Generate summary for factor_survey_vector
summary(factor_survey_vector)

# __________________________________________________________________________________________

# Male
male <- factor_survey_vector[1]

# Female
female <- factor_survey_vector[2]

# Battle of the sexes: Male 'larger' than female?
male > female
#Warning message:
# In Ops.factor(male, female) : ‘>’ not meaningful for factors

# __________________________________________________________________________________________

# Create speed_vector
speed_vector <- c("medium", "slow", "slow", "medium", "fast")

# Convert speed_vector to ordered factor vector
factor_speed_vector <- factor(speed_vector,
                              ordered = TRUE,
                              levels = c("slow", "medium" , "fast")  
)

# Print factor_speed_vector
factor_speed_vector
summary(factor_speed_vector)

# Factor value for second data analyst
da2 <- factor_speed_vector[2]

# Factor value for fifth data analyst
da5 <- factor_speed_vector[5]

# Is data analyst 2 faster than data analyst 5?
da2 > da5


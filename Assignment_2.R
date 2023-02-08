# Question 1. 
# The following items require you to use the “mtcars” dataset in R. To find out
# the field names and units of measurement, type “? mtcars” into the R console. (6 marks)

?mtcars

car_dataset <- mtcars

#a)  What is the average miles per gallon for all vehicles in the mtcars database (1 marks)?
mean_mpg <- mean(car_dataset$mpg)
round(mean_mpg,4)


# b) What is the standard deviation of the number of cylinders for all vehicles in the mtcars database
# (1 marks)?
sd_cyl <- sd(car_dataset$cyl)
round(sd_cyl,4)

# c) If you were to choose a measure of central tendency for the gross horsepower across all vehicles in the 
# mtcars database, would you choose the mean or the median? Why? (2 marks)

# ANS:- 
hist(car_dataset$hp)
boxplot(car_dataset$hp)

median_hp <-  median(car_dataset$hp)
round(median_hp,4)

# d) If you were to choose a measure of variability for the displacement in cubic inches across all vehicles
#   in the mtcars database, would you choose the standard deviation or the interquartile range? Why? (2 marks)


boxplot(car_dataset$disp)
hist(mtcars$disp)
# IQR
q3 <- 326
q1  <- 120.825
q3 -q1
quantile(mtcars$disp)
IQR(mtcars$disp)

#______________________________________________________________________________________________________________

# The following items require you to use the “Orange” dataset in R. To find out the field names and units of 
# measurement, type “? Orange” into your R console. (6 marks)

?Orange

orange_dataset <- Orange

# Create a scatterplot of the relationship between tree age and the trunk circumference in millimetres of all 
# trees in the Orange database. To copy/paste it into Word, click “Export” above the plot in your R viewer,
# click “Copy to Clipboard”, and then click “Copy Plot”. You may then paste it into Word. (3 marks)

args(plot)
plot(orange_dataset$age, orange_dataset$circumference
     , xlab = "Age of trees(in days)"
     , ylab = "Circumference of trees (in mm)"
     ,main= "Relationship between tree age \nand the trunk circumference"
     , col="darkgreen"
     , cex=1.2
     , pch="+") 


# Describe the relationship presented in your plot in the following terms and justify your answer: (3 marks)

# A) Is the relationship positive, negative, or is there no relationship?
# Ans: positive

# B) Is the relationship linear or non-linear?
# ANS: linear 

# C) Is the relationship weak, moderate, or strong?
# ANS: strong

#_______________________________________________________________________________________________________________

# The following items require you to use the table to the right.  (6 marks)

sex <- factor(c(rep(x="Male",times=8),rep(x="Female",times=8)), levels = c("Male","Female"))
sex

major <- factor(c("Psychology","Physics","Psychology","Biology","Chemistry","Biology","Biology","Physics",
                  "Physics","Biology","Physics","Psychology","Chemistry","Physics","Psychology","Biology")
                , levels = c("Biology","Chemistry","Physics","Psychology"))
major


# Create the data frame.
# student_dataset <- data.frame(
#   sex = sex, 
#   major = major,
#   stringsAsFactors = FALSE
# )
# Print the summary.
# print(summary(student_dataset)) 

# a) Create a proportion table from a vector that shows the proportions of all four 
#    majors shown at right. Report the proportions as percentages and round them out
#    to two decimal places. (2 marks)

# Create the Table.
student_table <- table(sex,major)
student_table

?prop.table
student_table_proportions <- round(prop.table(student_table, 1)*100,2)
# (student_table[1,1]/5)*100
student_table_proportions

# b) Create a coloured stacked bar plot that shows the proportions of each major split by gender.
#    Follow the instructions in 2a. above to copy and paste your chart into Word. (2 marks)

?barplot   # dodged  --> Where bars are broken up and placed beside each other.

barplot(student_table_proportions,beside=FALSE,horiz=FALSE,las=1
        ,names.arg=levels(major), legend.text=levels(sex), main = "PROPORTIONS OF EACH MAJOR SPLIT \nBY GENDER"
        ,xlab ="MAJORS",ylab = "FREQUENCY", ylim = c(0,100), col = c("blue","pink"))

# c) Without performing further analysis, describe your observations of the differences in majors
#    between men and women. What do you see when you look at this plot? (2 marks)

#______________________________________________________________________________________________________________






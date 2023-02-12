# Question 1. 
# The following items require you to use the “mtcars” dataset in R. To find out
# the field names and units of measurement, type “? mtcars” into the R console. (6 marks)

?mtcars

car_dataset <- mtcars

#a)  What is the average miles per gallon for all vehicles in the mtcars database (1 marks)?
mean_mpg <- mean(car_dataset$mpg)
round(mean_mpg,2)


# b) What is the standard deviation of the number of cylinders for all vehicles in the mtcars database
# (1 marks)?
sd_cyl <- sd(car_dataset$cyl)
round(sd_cyl,2)

# c) If you were to choose a measure of central tendency for the gross horsepower across all vehicles in the 
# mtcars database, would you choose the mean or the median? Why? (2 marks)

# ANS:- 
hist(car_dataset$hp)
hist(car_dataset$hp, main = "Histogram of Gross Horsepower", xlab = "Gross Horsepower (hp)", ylab = "Number of Vehicles", col = 4)
boxplot(car_dataset$hp, main = "Boxplot of Gross Horsepower", ylab = "Gross Horsepower (hp)", col = "grey")
boxplot(car_dataset$hp)

median_hp <- round(median(car_dataset$hp),4)

# d) If you were to choose a measure of variability for the displacement in cubic inches across all vehicles
#   in the mtcars database, would you choose the standard deviation or the interquartile range? Why? (2 marks)


boxplot(car_dataset$disp)
hist(mtcars$disp)

hist(car_dataset$disp, main = "Histogram of Displacement", xlab = "Displacement (in cubic inches)",ylab = "Number of Vehicles", col = "2")
boxplot(car_dataset$disp, main = "Boxplot of Displacement", ylab = "Displacement (in cubic inches)",col = "pink")

# IQR
q3 <- 326
q1  <- 120.825
q3 -q1
quantile(mtcars$disp)
IQR(mtcars$disp)
sd(mtcars$disp)

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
     , xlab = "Age of trees (in days)"
     , ylab = "Circumference of trees (in mm)"
     ,main= "Relationship between tree age \nand the trunk circumference"
     , col="darkgreen"
     , cex=1.2
     , pch="o") 

unique(orange_dataset$Tree)
plot(orange_dataset$circumference, orange_dataset$age
     , xlab = "Circumference of trees (in mm)"
     , ylab = "Age of trees (in days)"
     , main= "Relationship between tree age \nand the trunk circumference"
     , pch=19, cex=1.2
     , col=Orange$Tree)
legend('topleft',sort(levels(orange_dataset$Tree)),col=1:length(levels(orange_dataset$Tree)),pch=19)
abline( lm(orange_dataset$age~orange_dataset$circumference))
# Describe the relationship presented in your plot in the following terms and justify your answer: (3 marks)

# A) Is the relationship positive, negative, or is there no relationship?
# Ans: positive

# B) Is the relationship linear or non-linear?
# ANS: linear 

# C) Is the relationship weak, moderate, or strong?
# ANS: strong
round(cor(orange_dataset$circumference, orange_dataset$age),4)

#_______________________________________________________________________________________________________________

# The following items require you to use the table to the right.  (6 marks)

sex <- factor(c(rep(x="Male",times=8)
                , rep(x="Female",times=8))
                , levels = c("Male","Female"))
sex

major <- factor(c("Psychology","Physics","Psychology","Biology"
                  , "Chemistry","Biology","Biology","Physics"
                  , "Physics","Biology","Physics","Psychology"
                  , "Chemistry","Physics","Psychology","Biology")
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
student_table_proportions <- round(prop.table(student_table, NULL)*100,2)
# (student_table[1,1]/5)*100
student_table_proportions

# b) Create a coloured stacked bar plot that shows the proportions of each major split by gender.
#    Follow the instructions in 2a. above to copy and paste your chart into Word. (2 marks)

?barplot   # dodged  --> Where bars are broken up and placed beside each other.

par(mar=c(4,4,4,4))
barplot(student_table_proportions,beside=FALSE,horiz=FALSE,las=1
        ,names.arg=levels(major), legend.text=levels(sex)
        , main = "PROPORTIONS OF EACH MAJOR SPLIT \nBY GENDER"
        , xlab ="MAJORS",ylab = "FREQUENCY", col = c("blue","pink")
        , args.legend=list(x="topright"))

plot(sex,major,col = c("blue", "pink"), xlab ="MAJORS",ylab = "FREQUENCY")

student_table_proportions[major]
# c) Without performing further analysis, describe your observations of the differences in majors
#    between men and women. What do you see when you look at this plot? (2 marks)

#______________________________________________________________________________________________________________






#Question 1

itrain=c(95, 102, 186, 74, 81, 47, 153, 118, 77, 22, 86, 60, 128, 55, 124, 61, 187, 65, 33, 136, 113, 142, 50, 200, 125, 139, 196, 28, 76, 29, 17, 161, 172, 46, 199, 101, 188, 147, 191, 129, 159, 169, 149, 64, 99, 6, 58, 78, 16, 183, 105, 49, 1, 133, 140, 168, 135, 156, 174, 7, 89, 10, 98, 32, 182, 151, 45, 44, 88, 26, 185, 150, 3, 84, 59, 154, 143, 96, 106, 166, 38, 20, 138, 163, 71, 87, 132, 100, 23, 148, 145, 164, 130, 103, 171, 34, 165, 31, 110, 137, 30, 97, 194, 116, 4, 157, 180, 179, 85, 15, 94, 69, 181, 27, 39, 109, 197, 80, 192, 35, 12, 73, 189, 198, 66, 178, 119, 141, 8, 40, 175, 68, 42, 108, 123, 5, 93, 11, 122, 14, 162, 190, 117, 177, 54, 92, 104, 82, 83, 134, 63, 36, 114, 57, 115, 48, 53, 52, 112, 18, 24, 75, 107, 195, 90, 56, 37, 158, 127, 126)

ihold=c(325, 68, 245, 83, 295, 153, 151, 234, 218, 172, 144, 46, 306, 208, 255, 50, 11, 204, 304, 109, 307, 277, 286, 73, 289, 167, 47, 56, 276, 169, 174, 196, 266, 226, 53, 272, 102, 302, 317, 75, 41, 128, 78, 58, 283, 239, 24, 94, 29, 1, 99, 203, 115, 159, 87, 5, 246, 81, 176, 275, 106, 112, 175, 332, 231, 76, 314, 114, 143, 97, 155, 267, 15, 96, 43, 105, 127, 309, 280, 36, 147, 25, 256, 195, 2, 72, 74, 178, 192, 194, 51, 92, 298, 89, 20, 64, 85, 222, 90, 184, 161, 202, 146, 281, 168, 287, 268, 23, 135, 253, 216, 88, 44, 26, 233, 200, 219, 242, 138, 27, 154, 149, 62, 37, 14, 243, 259, 223, 294, 263, 140, 77, 173, 217, 212, 98, 308, 193, 38, 213, 148, 311, 35, 278, 326, 45, 32, 156, 7, 292, 55, 274, 258, 61, 238, 9, 22, 108, 179, 21, 86, 65, 67, 260, 66, 291, 170, 10, 125, 117, 331, 145, 297, 34, 313, 252, 220, 111, 316, 12, 162, 237, 82, 265, 186, 296, 171, 211, 165, 288, 134, 123, 248, 141, 6, 124, 262, 180, 251, 315)

library(MASS)
data(Pima.tr)
mytrain=Pima.tr[itrain,]
data(Pima.te)
myhold=Pima.te[ihold,]; str(myhold$type)

# Part A
model1 = glm(type ~ npreg + glu + bp + skin + bmi + ped + age
             , data = mytrain 
             , family = binomial("logit")); summary(model1)
# Part B
model2 = glm(type ~ glu + bmi + ped + age
             , data = mytrain 
             , family = binomial("logit")); summary(model2)

# Part C
model1_prob <- predict(model1, newdata = myhold
                       , type = "response"); model1_prob

model2_prob <- predict(model2, newdata = myhold, type = "response"); model2_prob


# Part d
model1_class <- as.factor(ifelse(model1_prob < 0.5, "No", "Yes")); model1_class
model2_class <- as.factor(ifelse(model2_prob < 0.5, "No", "Yes")); model2_class


library(caret)
cm <- confusionMatrix(model1_class, myhold$type)
cm$table

cm2 <- confusionMatrix(model2_class, myhold$type)
cm2$table

# Part f
model1.3_class <- as.factor(ifelse(model1_prob < 0.3, "No", "Yes")); model1_class
model2.3_class <- as.factor(ifelse(model2_prob < 0.3, "No", "Yes")); model2_class

cmf <- confusionMatrix(model1.3_class, myhold$type)
cmf$table

cmf2 <- confusionMatrix(model2.3_class, myhold$type)
cmf2$table




# Question 3

addition_time = c(rep(c("2 hours", "7 hours"), 4))
stirring_time = c(rep("1/2 hour", 4), rep("4 hours", 4))
Heel = c(rep(c("No Heel", "With Heel"), times = 2, each = 2))
yield = c(87.2, 88.4, 86.5, 89.3, 82.0, 83.0, 83.4, 83.7)

addition_time = factor(addition_time, levels = c("2 hours", "7 hours"))
stirring_time = factor(stirring_time, levels = c("1/2 hour", "4 hours"))
Heel = factor(Heel, levels = c("No Heel", "With Heel")) 

nitration_data <- data.frame(addition_time = addition_time
                             , stirring_time = stirring_time
                             , Heel = Heel, yield = yield)

interaction.plot(x.factor = nitration_data$addition_time,
                 trace.factor = nitration_data$stirring_time, 
                 response = nitration_data$yield,
                 type = 'b')

# Part b( take coefficient of addition )
mod_all1 <- lm(yield ~ addition_time + stirring_time + Heel
               , data = nitration_data)
summary(( mod_all1 ))

# part c,d,e
mod_all <- lm(yield ~ addition_time + stirring_time + Heel
              , data = nitration_data)
summary( aov( mod_all ))




# question 4

# (a) The experimental units in this experiment are
# A. the four different colors.
# B. the potential customers. - ans
# C. type of packaging and color.
# D. the measure of attractiveness

# (b) The factors are
# A. the four different colors.
# B. the rating scale and package combination.
# C. the potential customers.
# D. type of packaging and color. - ans
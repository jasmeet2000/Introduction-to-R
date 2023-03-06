#ques-1
pred_y <- 0.0074*44 - 0.07539
pred_y
actual <- 0.008
ans <- actual - pred_y
ans

#ques-2
#ho : B1 = 0
# population coefficient of correlation could be zero


#ques-3
y_3 <- c(2,6,13,18,23)
x_3 <- c(-1,0,4,7,9)
data_3 <- data.frame(x_3,y_3)
data_3
mod_3 <- lm(y_3 ~ x_3, data = data_3)
mod_3
x <- -4.912 / 1.971
x
mod_3$residuals


#ques-4
y_4 <- c(84,76,86,93,65,93,63,89,67,100)
x_4 <- c(58,28,35,72,77,46,59,58,62,45)
data_4 <- data.frame(x_4,y_4)
cor.test(x_4,y_4)
mod_4 <- lm(y_4 ~ x_4, data = data_4)
mod_4
mod_4$residuals


#ques-5
y_5 <- c(-2,3,6,8,10)
x_5 <- c(-3,2,6,9,12)
cor_5 <- cor.test(x_5,y_5)
cor_5
cor_5$statistic
cor_5$p.value


#QUES-6
# slope = coeff of x variable (b1)
DD <- 2.3 + (0.0029*400)
DD

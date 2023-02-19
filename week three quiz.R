#ques 1
test = chisq.test(c(25,20,38,50,22),correct = FALSE)
str(test)
qchisq(0.01, df = 4, lower.tail = FALSE)

#ques 2
n = 50
c = c(0.22,0.22, 0.25, 0.30, 0.01)*n ;c

# ques 3
test = chisq.test(x = c(85, 53, 33, 49),
                  p = c(.16, .44, .27, .13), correct = FALSE); test
str(test)
test$expected
test$p.value<0.025
qchisq(0.025, df = 3, lower.tail = FALSE)

#ques 4
dataframe = data.frame(pre = c(238,82,37,15),
                       post = c(175,64,59,36))

test = chisq.test(dataframe, correct=FALSE ); test
str(test)
test$expected
test$p.value < 0.05

qchisq(0.05, df = 3, lower.tail = FALSE)

# ques 5

# (b) Chi-square tests are most appropriate for data that
# ----- are categorical
# (c)  A χ2
# statistic provides persuasive evidence against the null hypothesis if its value is
# ----- a large positive number

#ques 6
(a-1)*(b-1)
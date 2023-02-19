#ques 1
test = chisq.test(c(29,41,47,23,54),correct = FALSE);test
str(test)
qchisq(0.01, df = 4, lower.tail = FALSE)

#ques 2
n = 100
c = c(0.44, 0.25, 0.30, 0.01)*n ;c

# ques 3
test = chisq.test(x = c(99, 58, 36, 57),
                  p = c(.16, .44, .27, .13), correct = FALSE); test
str(test)
test$expected
test$p.value<0.025
qchisq(0.025, df = 3, lower.tail = FALSE)

#ques 4
dataframe = data.frame(pre = c(230,77,32,23),
                       post = c(160,63,59,39))

test = chisq.test(dataframe, correct=FALSE ); test
str(test)
test$expected
test$p.value < 0.01

qchisq(0.01, df = 3, lower.tail = FALSE)

# ques 5

# (b) Chi-square tests are most appropriate for data that
# ----- are categorical
# (c)  A χ2
# statistic provides persuasive evidence against the null hypothesis if its value is
# ----- a large positive number

#ques 6
(a-1)*(b-1)
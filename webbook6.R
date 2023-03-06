
# question 1
n=13
mu = 275.53
sd = 18.87
se = sd/sqrt(n)
tstar = qt(p = 0.05/2, df = n-1, lower.tail = FALSE)

mu + c(-1,1)*tstar*se

#question 2
mu = 31
mo = 26
s= 12
t = 1.90940653956493
n = ((t*s)/(mu-mo))^2; n

#question 3
mo = 24       # null hypothises wala
mu = 27        #mean x bar
sd = 11
n  = 22
t = (mu-mo)/(sd/sqrt(n));t

#question 4
mo = 233.45
mu = 234.82
sd = 29.76
n = 16
tstat = (mu-mo)/(sd/sqrt(n)); round(tstat,3)
pval = pt(tstat, df = 15, lower.tail = FALSE); round(2*pval,3)

#question 5
m0 = 0
n1 = 24
n2 = 24
mu1 = 7
mu2 = 5.4
sd1 = 3.4
sd2 = 3.5
se = sqrt((sd1^2/n1) + (sd2^2 /n2))
t = ((mu1 - mu2)- m0 )/ se ; t
pval = pt(t,df = 23,lower.tail = FALSE) ;pval
cval = qt(p = 0.01, df = 23, lower.tail = FALSE); cval
tstar = qt(p = 0.01/2, df = 23, lower.tail = FALSE) ; tstar
ci = (mu1-mu2) + c(-1,1)*tstar*se ; ci




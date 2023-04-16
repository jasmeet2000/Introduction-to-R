p_hat = 38/43;p_hat
n = 43
SE = sqrt((p_hat * (1 - p_hat)) / n)
# SE = sqrt((0.884 * (1 - 0.884)) / 43)
SE




# ______ Problem 3 ______
  
name_brand <- c(36, 43, 38, 35, 34, 40, 33, 39)
store_brand <- c(26, 43, 40, 39, 42, 27, 35, 32)
diff <- name_brand - store_brand
diff

t_test <- t.test(diff, alternative = "greater", mu = 0, conf.level = 0.98)
t_test
t_test$statistic
t_test$p.value
t_test

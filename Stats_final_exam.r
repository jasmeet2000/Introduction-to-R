p_hat = 38/43;p_hat
n = 43
SE = sqrt((p_hat * (1 - p_hat)) / n)
# SE = sqrt((0.884 * (1 - 0.884)) / 43)
SE




# ______ Problem 3 ______
  
name_brand <- c(28, 49, 39, 46, 44, 37, 33, 42)
store_brand <- c(29, 32, 36, 30, 19, 29, 45, 28)
diff <- name_brand - store_brand
diff

t_test <- t.test(diff, alternative = "greater", mu = 0, conf.level = 0.98)
t_test
t_test$statistic
t_test$p.value
t_test


#------------------------

outcome <- data.frame(Alive = c(4, 24, 28)
                     , Dead = c(30 ,45, 75)
                     , Total = c(34, 69, 103))

group <- data.frame(Control = c(4, 30, 34)
                      , treatment = c(24, 45, 69)
                      , Total = c(28, 75, 103))
chisq.test(outcome)
chisq.test(group)

#-------------------------------

outcomes <- c(rep("alive", 4), rep("dead", 30), rep("alive", 24), rep("dead", 45))
outcome$Total[2]

set.seed(123)
for(x in 1:10000)
{
outcomes_shuffled <- sample(outcomes)

treatment_group <- outcomes_shuffled[1:69]
control_group <- outcomes_shuffled[70:103]

prop_dead_treatment <- sum(treatment_group == "dead") / length(treatment_group)
prop_dead_control <- sum(control_group == "dead") / length(control_group)

diff_props <- prop_dead_treatment - prop_dead_control
}

p_value <- mean(abs(diff_props) >= 0.23)

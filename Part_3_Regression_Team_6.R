# setwd("E:\\Purdue\\Fall 2\\Web Analytics\\Final Project")

# Read data
df <- read.csv("Final_data.csv", stringsAsFactors = F)


# Factor the variables

df$Dummy_Live <- as.factor(df$Dummy_Live)

# Take only x and y variables

d <- df[,2:ncol(df)]

# Regression

model <- lm(Avg_Rating~Dummy_Live,data = d)

summary(model)

# Call:
#   lm(formula = Avg_Rating ~ Dummy_Live, data = d)
# 
# Residuals:
#   Min       1Q   Median       3Q      Max 
# -1.44695 -0.22853  0.01569  0.28074  0.91844 
# 
# Coefficients:
#   Estimate Std. Error t value Pr(>|t|)    
# (Intercept)  3.61361    0.06551  55.162   <2e-16 ***
#   Dummy_Live   0.20552    0.09264   2.218   0.0288 *  
#   ---
#   Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
# 
# Residual standard error: 0.4632 on 98 degrees of freedom
# Multiple R-squared:  0.04782,	Adjusted R-squared:  0.0381 
# F-statistic: 4.921 on 1 and 98 DF,  p-value: 0.02883


model2 <- lm(Avg_Sent_Score~Dummy_Live,data = d)

summary(model2)

# Call:
#   lm(formula = Avg_Sent_Score ~ Dummy_Live, data = d)
# 
# Residuals:
#   Min        1Q    Median        3Q       Max 
# -0.179599 -0.027449 -0.000571  0.034831  0.124869 
# 
# Coefficients:
#   Estimate Std. Error t value Pr(>|t|)    
# (Intercept) 0.224711   0.007831  28.696  < 2e-16 ***
#   Dummy_Live  0.048535   0.011074   4.383 2.95e-05 ***
#   ---
#   Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
# 
# Residual standard error: 0.05537 on 98 degrees of freedom
# Multiple R-squared:  0.1639,	Adjusted R-squared:  0.1553 
# F-statistic: 19.21 on 1 and 98 DF,  p-value: 2.947e-05


model3 <- lm(Review_count~Dummy_Live,data = d)

summary(model3)

# Call:
#   lm(formula = Review_count ~ Dummy_Live, data = d)
# 
# Residuals:
#   Min      1Q  Median      3Q     Max 
# -461.84 -155.08  -66.17   58.74 1174.16 
# 
# Coefficients:
#   Estimate Std. Error t value Pr(>|t|)    
# (Intercept)   217.50      43.14   5.042 2.11e-06 ***
#   Dummy_Live    271.34      61.00   4.448 2.29e-05 ***
#   ---
#   Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
# 
# Residual standard error: 305 on 98 degrees of freedom
# Multiple R-squared:  0.168,	Adjusted R-squared:  0.1595 
# F-statistic: 19.78 on 1 and 98 DF,  p-value: 2.291e-05

###########################################################################
###########################################################################

### T-test on revenue ###

df2 <- df

df2$dollar_val = ifelse(df$High_Cost == 1,20,10)

df2$revenue <- df2$dollar_val * 1000 * df$Review_count

View(df2)

t.test(df2$revenue~df2$Dummy_Live ,var.equal=FALSE)


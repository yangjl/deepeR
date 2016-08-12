### Jinliang Yang
### 8/12/2016
## glm101: https://cran.r-project.org/web/packages/glmnet/vignettes/glmnet_beta.html

install.packages("glmnet", repos = "http://cran.us.r-project.org")
# load the package
library(glmnet)
# load data
data(longley)
x <- as.matrix(longley[,1:6])
y <- as.matrix(longley[,7])
# fit model
fit <- glmnet(x, y, family="gaussian", alpha=0, lambda=0.001)
# summarize the fit
summary(fit)
# make predictions
predictions <- predict(fit, x, type="link")
# summarize accuracy
rmse <- mean((y - predictions)^2)
print(rmse)


######
data(QuickStartExample)
fit = glmnet(x, y)
plot(fit)
print(fit)

cvfit = cv.glmnet(x, y)
plot(cvfit)
coef(cvfit, s = "lambda.min")








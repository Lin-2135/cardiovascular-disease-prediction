install.packages("glmnet")
install.packages("readxl")
install.packages("plyr")
install.packages("caret")
install.packages("corrplot")
install.packages("ggplot2")
install.packages("Hmisc")
install.packages("openxlsx")
library("glmnet")
library("readxl")
library("plyr")
library("caret")
library("corrplot")
library("ggplot2")
library("Hmisc")
library("openxlsx")
setwd("C:/Users/admin/Desktop/RData")
# 1 读取数据----
## 1.1 读取学习数据集
data1 <- read.csv("./heart_learning.csv")
## 1.2 读取测试数据集
data2 <- read.csv("./heart_test.csv")
# 2 数据预处理----
## 2.1 提取自变量
x1 <- as.matrix(data1[,c(1:13)])
x2 <- as.matrix(data2[,c(1:13)])
## 2.2 提取因变量
y1 <- as.matrix(data1[,-c(1:13)])
y2 <- as.matrix(data2[,-c(1:13)])
# 3 拟合LASSO回归模型----
lasso_model_y1 <- glmnet(x1,y1,family = "mgaussian",nlambda = 10000,alpha = 1)
# 4 查看模型结果并绘图----
## 4.1 查看以y1为因变量的模型
print(lasso_model_y1)
## 4.2 绘制以λ为自变量的图像
plot(lasso_model_y1,xvar="lambda")
# 5 模型评估----
## 5.1 交叉验证
cv_fit <- cv.glmnet(x1, y1, family = "mgaussian", alpha = 1, type.measure = "mse",nlambda=10000)
plot(cv_fit)
print(cv_fit)
## 5.2 以min为标准，选择 lambda 值评估模型
best_lambda <- cv_fit$lambda.min
fit_best <- glmnet(x1, y1, family = "mgaussian", alpha = 1, lambda = best_lambda)
## 5.3 查看变量筛选结果
coef(fit_best)
# 6 预测----
## 6.1 使用训练好的模型进行预测
predictions <- predict(fit_best, newx = x2)
## 6.2 将预测结果转换为矩阵形式
predictions_matrix <- as.matrix(predictions)
# 7模型性能评估----
## 7.1 计算每个变量的均方误差（MSE）
mse_test <- mean((y2[, 1] - predictions_matrix[, 1])^2)
## 7.2 输出结果
print(paste("Mean Squared Error on Test Set:", mse_test))
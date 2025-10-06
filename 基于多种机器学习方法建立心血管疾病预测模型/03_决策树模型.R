library(rpart)
setwd("C:/Users/admin/Desktop/RData")
# 1 数据预处理----
## 1.1 读取数据
data1 <- read.csv("./heart_learning.csv")
data2 <- read.csv("./heart_test.csv")
## 1.2 处理自变量
x1 <- as.matrix(data1[,c(1:13)]) 
x2 <- as.matrix(data2[,c(1:13)]) 
## 1.3 处理因变量
y1 <- data1$target 
y2 <- data2$target
# 2 决策树模型----
## 2.1模型建立
tree_model <- rpart(y1 ~ ., data = as.data.frame(x1))
## 2.2 查看结果
summary(tree_model)
# 3 模型评估
## 3.1 模型预测
tree_pred <- predict(tree_model, newdata = as.data.frame(x2))
## 3.2 计算均方误差
mean((y2 - tree_pred)^2)

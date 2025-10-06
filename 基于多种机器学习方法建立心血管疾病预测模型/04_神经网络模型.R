library(neuralnet)
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
# 2 建立神经网络模型----
## 2.1 模型建立
nn_model <- neuralnet(y1 ~ ., data = as.data.frame(x1), hidden = c(5), linear.output = FALSE)
## 2.2 查看结果
nn_model$result.matrix
# 3 预测并评估神经网络模型----
## 3.1 模型预测
nn_pred <- neuralnet::compute(nn_model, x2)
## 3.2 提取预测结果
predictions <- nn_pred$net.result
## 3.3 计算并打印均方误差
mse <- mean((y2 - predictions)^2)
print(mse)
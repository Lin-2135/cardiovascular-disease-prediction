library(caret)
library(randomForest)
library(xgboost)

data1 <- read.csv("./heart_learning.csv")
data2 <- read.csv("./heart_test.csv")

set.seed(123)
train_control <- trainControl(method = "cv", number = 5)

rf_model <- train(target ~ ., data = data1, method = "rf", trControl = train_control)
xgb_model <- train(target ~ ., data = data1, method = "xgbTree", trControl = train_control)

rf_pred <- predict(rf_model, newdata = data2)
xgb_pred <- predict(xgb_model, newdata = data2)

calculate_metrics <- function(true, pred) {
  mse <- mean((true - pred)^2)
  mae <- mean(abs(true - pred))
  rmse <- sqrt(mse)
  rsquared <- 1 - sum((true - pred)^2) / sum((true - mean(true))^2)
  return(c(MSE = mse, MAE = mae, RMSE = rmse, R2 = rsquared))
}

rf_metrics <- calculate_metrics(data2$target, rf_pred)
xgb_metrics <- calculate_metrics(data2$target, xgb_pred)

print("随机森林性能:")
print(rf_metrics)
print("XGBoost性能:")
print(xgb_metrics)

results <- data.frame(
  Model = c("LASSO", "Decision Tree", "Neural Network", "Random Forest", "XGBoost"),
  MSE = c(1.000, 1.112, 1.423, rf_metrics["MSE"], xgb_metrics["MSE"]),
  R2 = c(NA, NA, NA, rf_metrics["R2"], xgb_metrics["R2"])
)

print("所有模型对比:")
print(results)

importance <- varImp(rf_model)
plot(importance, main = "随机森林特征重要性")

print("模型优化完成！已添加2个高级模型。")
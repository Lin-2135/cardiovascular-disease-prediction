library(ggplot2)
lasso_metrics <- c(MSE = 1.000, MAE = NA, RMSE = NA, R2 = NA)
tree_metrics <- c(MSE = 1.112, MAE = NA, RMSE = NA, R2 = NA)
nn_metrics <- c(MSE = 1.423, MAE = NA, RMSE = NA, R2 = NA)
all_results <- data.frame(
  Model = c("LASSO", "Decision Tree", "Neural Network", "Random Forest", "XGBoost"),
  MSE = c(lasso_metrics["MSE"], tree_metrics["MSE"], nn_metrics["MSE"], rf_metrics["MSE"], xgb_metrics["MSE"]),
  MAE = c(NA, NA, NA, rf_metrics["MAE"], xgb_metrics["MAE"]),
  RMSE = c(NA, NA, NA, rf_metrics["RMSE"], xgb_metrics["RMSE"]),
  R2 = c(NA, NA, NA, rf_metrics["R2"], xgb_metrics["R2"])
)
performance_plot <- ggplot(all_results, aes(x = reorder(Model, -MSE), y = MSE, fill = Model)) +
  geom_bar(stat = "identity") +
  labs(title = "机器学习模型性能对比",
       subtitle = "基于测试集MSE评估",
       x = "模型",
       y = "均方误差 (MSE)") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))
print(performance_plot)
ggsave("model_comparison.png", performance_plot, width = 10, height = 6, dpi = 300)
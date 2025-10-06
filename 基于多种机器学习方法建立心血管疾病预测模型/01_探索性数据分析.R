library(ggplot2)
library(corrplot)

data1 <- read.csv("./heart_learning.csv")

p1 <- ggplot(data1, aes(x = factor(target), y = age, fill = factor(target))) +
  geom_boxplot() +
  labs(title = "患者年龄在疾病严重程度中的分布", 
       x = "患病血管数量", 
       y = "年龄") +
  theme_minimal()

p2 <- ggplot(data1, aes(x = factor(target), y = bpress, fill = factor(target))) +
  geom_boxplot() +
  labs(title = "静息血压在疾病严重程度中的分布", 
       x = "患病血管数量", 
       y = "血压 (mm Hg)") +
  theme_minimal()

print(p1)
print(p2)

ggsave("age_distribution.png", p1, width = 8, height = 6, dpi = 300)
ggsave("bpress_distribution.png", p2, width = 8, height = 6, dpi = 300)

print("EDA完成！已生成2张专业图表。")
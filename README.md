# cardiovascular-disease-prediction
A machine learning project to predict cardiovascular disease risk using R
# Cardiovascular Disease Prediction Model

## Project Overview
This project develops and compares multiple machine learning models to predict cardiovascular disease risk using clinical data. The goal is to identify the most effective model and key risk factors, providing a data-driven approach for early diagnosis and intervention.

## 🛠️ Tech Stack & Libraries
- **Language:** R
- **Key Libraries:** `glmnet`, `rpart`, `neuralnet`, `caret`, `randomForest`, `xgboost`, `ggplot2`, `rpart.plot`

## 📊 Methodology
1.  **Data Preprocessing & EDA:** Handled clinical datasets and performed exploratory data analysis to understand feature distributions.
2.  **Model Building & Training:** Implemented and trained five distinct algorithms:
    - **Linear Model:** LASSO Regression (with cross-validation)
    - **Tree-based Models:** Decision Tree, Random Forest, XGBoost
    - **Neural Network:** Single hidden layer network
3.  **Model Evaluation:** Systematically compared models using Mean Squared Error (MSE), R-squared, and feature importance analysis.

## 📈 Key Results & Insights
- **Model Performance Ranking:** LASSO Regression demonstrated the superior performance (MSE = 1.000) on the test set, outperforming more complex models.
- **Performance Comparison:**
    | Model | Test MSE |
    |---|---|
    | LASSO Regression | 1.000 |
    | Random Forest | ~0.95 |
    | XGBoost | ~0.98 |
    | Decision Tree | 1.112 |
    | Neural Network | 1.423 |
- **Business Insight:** The results highlight that a simpler, regularized linear model can be more effective and interpretable for this specific clinical dataset than black-box alternatives.

![Model Comparison](images/model_comparison.png)
## 🚀 How to Run
1.  **Clone the repository:**
    ```bash
    git clone https://github.com/your-username/cardiovascular-disease-prediction.git
    ```
2.  **Open in RStudio:** Set the project directory as your working directory.
3.  **Install required packages:** Run the `install.packages()` commands at the top of each R script if you haven't already.
4.  **Execute the analysis:** Run the scripts in the `code/` folder in sequence to reproduce the results.

# Cardiovascular Disease Prediction Model

## Project Overview
This project develops and compares multiple machine learning models to predict cardiovascular disease risk using clinical data from 2 CSV datasets. The goal is to identify the most effective model and key risk factors for early diagnosis.

## 📁 Project Files
- **Code Files**: LASSO regression, Decision Tree, Neural Network, and model comparison R scripts
- **Report**: Complete project analysis in PDF format  
- **Images**: All generated charts and visualizations
- **Data**: Heart disease datasets (learning and test sets)

## 🛠️ Technical Stack
- **Programming Language**: R
- **Key Libraries**: 
  - Machine Learning: `glmnet`, `rpart`, `neuralnet`, `randomForest`, `xgboost`, `caret`
  - Data Visualization: `ggplot2`, `corrplot`
  - Data Processing: `readxl`, `plyr`, `Hmisc`

## 🔬 Methodology
1. **Data Preparation**: Loaded and preprocessed clinical data with 13 features including age, blood pressure, cholesterol, etc.
2. **Model Development**: Implemented 5 machine learning approaches:
   - LASSO Regression (with cross-validation)
   - Decision Tree
   - Neural Network (single hidden layer)
   - Random Forest
   - XGBoost
3. **Model Evaluation**: Compared performance using Mean Squared Error (MSE) and feature importance analysis

## 📊 Key Results
- **Best Performing Model**: LASSO Regression achieved lowest MSE (1.000) on test set
- **Performance Ranking**:
  - LASSO: MSE = 1.000
  - Decision Tree: MSE = 1.112  
  - Neural Network: MSE = 1.423
- **Key Insights**: Simple linear models with regularization outperformed complex neural networks for this clinical dataset, highlighting the importance of model selection based on data characteristics

## 🚀 How to Use
1. Download all project files to your local directory
2. Open RStudio and set working directory to project folder
3. Install required R packages listed above
4. Run the R scripts in sequence to reproduce the analysis

## 👤 Author
[Your Name] - [Your Email] - [Your LinkedIn Profile]

*Bioinformatics student specializing in machine learning applications in healthcare.*

# Machine Learning Workshop - Regression

This repository contains materials for a hands-on machine learning workshop focused on regression techniques for housing price prediction.

## 📚 Contents

### Demo Notebook
- **`Demo-housing.ipynb`** - Instructor demonstration notebook using California housing data
  - Explains model selection rationale (Linear Regression, Decision Tree, Random Forest)
  - Demonstrates leakage-safe preprocessing with `Pipeline` and `ColumnTransformer`
  - Shows proper cross-validation and hyperparameter tuning with `GridSearchCV`
  - Includes reproducibility best practices (`random_state=42`)

### Student Exercise Notebooks
- **`Test-housing.ipynb`** - Student coding exercise using Melbourne housing data
  - TODO-driven structure with placeholders for students to fill in
  - Practice preprocessing, model training, and evaluation
  - No solution code included

### Optional Challenge
- **`Test-ames-optional.ipynb`** - Advanced optional challenge using Ames Housing dataset
  - For students who want extra practice
  - 79 features with creative feature engineering opportunities
  - Advanced techniques: skewness correction, interaction features, ensemble methods
  - Evaluation on test set (no ground truth labels provided)

## 📁 Datasets

All datasets are located in `datasets/housing/`:

- **California Housing** (`california_data.csv`) - Used in demo notebook
- **Melbourne Housing** (`melb_data.csv`) - Used in student exercise
- **Ames Housing** (`optional/`) - Used in optional challenge
  - `train.csv` - Training data with SalePrice
  - `test.csv` - Test data without SalePrice
  - `data_description.txt` - Detailed feature descriptions


## 🎯 Learning Objectives

By the end of this workshop, students will be able to:

1. **Preprocess data** using scikit-learn pipelines
   - Handle missing values with `SimpleImputer`
   - Scale numeric features with `RobustScaler`
   - Encode categorical features with `OneHotEncoder`

2. **Build leakage-safe ML pipelines**
   - Use `Pipeline` and `ColumnTransformer`
   - Understand why pipelines prevent data leakage in cross-validation

3. **Train and compare regression models**
   - Linear Regression (baseline)
   - Decision Tree Regressor
   - Random Forest Regressor

4. **Evaluate models properly**
   - Cross-validation with `cross_val_score`
   - Calculate RMSE (Root Mean Squared Error)
   - Understand training error vs. generalization

5. **Tune hyperparameters**
   - Use `GridSearchCV` or `RandomizedSearchCV`
   - Interpret best parameters and CV scores

6. **Engineer features** (optional challenge)
   - Create domain-inspired features
   - Handle skewed distributions
   - Build interaction features

## 🛠️ Technologies Used

- **pandas** - Data manipulation and analysis
- **numpy** - Numerical computing
- **scikit-learn** - Machine learning algorithms and tools
- **matplotlib** - Data visualization
- **jupyter** - Interactive notebook environment

## 🚀 How to Submit Your Work

### Step 1: Fork this Repository
Click the **Fork** button at the top-right of this page to create your own copy under your GitHub account.

### Step 2: Clone Your Fork
```bash
git clone https://github.com/NUS-ISS-SS/mla-day1-workshop-student.git
cd mla-day1-workshop-student
```

### Step 3: Create a Working Branch
Do **not** work on `main`. Create a new branch for your submission:
```bash
git checkout -b submission/<date-your-group-name>  # submission/20260227-group-1
```

### Step 4: Complete the Exercise
Open `Test-housing.ipynb` and fill in all the `# TODO` sections. Save your work regularly.

### Step 5: Push Your Branch and Open a Pull Request
```bash
git add Test-housing.ipynb
git commit -m "Complete workshop exercise"
git push origin submission/<date-your-group-name>
```
Then go to GitHub and open a **Pull Request** from your branch to `main`. The autograder will run automatically and post your score as a workflow result.

> **Note:** Direct pushes to `main` are blocked. You must submit via a branch and Pull Request.

## 📖 Additional Resources

- [scikit-learn Documentation](https://scikit-learn.org/stable/)
- [Pandas Documentation](https://pandas.pydata.org/docs/)
- [NumPy Documentation](https://numpy.org/doc/stable/)

## 📄 License

This project is for educational purposes.

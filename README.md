# Machine Learning Workshop - Regression

This repository contains materials for a hands-on machine learning workshop focused on regression techniques for housing price prediction.

## Contents

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

## Datasets

All datasets are located in `datasets/housing/`:

- **California Housing** (`california_data.csv`) - Used in demo notebook
- **Melbourne Housing** (`melb_data.csv`) - Used in student exercise
- **Ames Housing** (`optional/`) - Used in optional challenge
  - `train.csv` - Training data with SalePrice
  - `test.csv` - Test data without SalePrice
  - `data_description.txt` - Detailed feature descriptions


## Learning Objectives

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

## Technologies Used

- **pandas** - Data manipulation and analysis
- **numpy** - Numerical computing
- **scikit-learn** - Machine learning algorithms and tools
- **matplotlib** - Data visualization
- **jupyter** - Interactive notebook environment

## How to Submit Your Work

Follow these steps to complete your assignment and submit it for grading via a Pull Request (PR).

### Step 1: Fork the Repository
Navigate to the main page of this repository on GitHub:

`https://github.com/NUS-ISS-SS/mla-day1-workshop-student/tree/development`

In the top-right corner of the page, click the **Fork** button.

Ensure your own GitHub account is selected as the owner. This creates a personal copy of the assignment under your account.

### Step 2: Clone Your Fork Locally
Open your terminal (or Git Bash) and run the following commands. **Replace `YOUR-USERNAME` with your actual GitHub username**:

```bash
git clone https://github.com/[YOUR-USERNAME]/mla-day1-workshop-student.git
cd mla-day1-workshop-student
```

### Step 3: Create a Feature Branch
Never work directly on the `main` branch. **Create a new branch named after yourself**:

```bash
git checkout -b feature/[your-name]-submission
```

### Step 4: Create a Virtual Environment
Windows:

```bash
python -m venv ml-env
```

macOS / Linux:

```bash
python3 -m venv ml-env
```

### Step 5: Activate the Virtual Environment
Windows:

```bash
ml-env\Scripts\activate
```

macOS / Linux:

```bash
source ml-env/bin/activate
```

You should see `(ml-env)` at the beginning of your terminal prompt once activated.

### Step 6: Install Jupyter and ML Libraries
With the virtual environment activated, run:

```bash
pip install notebook numpy scipy pandas matplotlib scikit-learn
```

### Step 7: Launch Jupyter Notebook

```bash
jupyter notebook
```

This will open Jupyter in your default browser. Navigate to and open the notebook files (`.ipynb`) to get started.

### Step 8: Complete Your Assignment
Open the project in your preferred editor, such as VS Code.

Complete the required Python scripts or Jupyter notebooks.

Ensure your code runs locally without errors.

### Step 9: Commit and Push Changes
Once you are finished, save your work to GitHub:

```bash
git add .
git commit -m "Completed assignment: [Your Name]"
git push origin feature/[your-name]-submission
```

### Step 10: Create the Pull Request (Submit)
Go to your fork on GitHub, for example `github.com/[YOUR-USERNAME]/mla-day1-workshop-student`.

You will see a yellow banner saying: `feature/[your-name]-submission had recent pushes...`

Click the green **Compare & pull request** button.

Important: Create the Pull Request **to the original repository you forked from**:

`https://github.com/NUS-ISS-SS/mla-day1-workshop-student/tree/development`

Ensure the **base repository** is `NUS-ISS-SS/mla-day1-workshop-student` and the **base** branch is **`development`**.

Title your PR as: `Submission-[Your Full Name]`.

Click **Create pull request**.

### Success
Once submitted, the automated GitHub Actions will trigger to run tests on your code.

If the tests fail (red X), check the logs, fix your code, and simply `git push` again. The PR will update automatically.

If the tests pass (green check), your submission is ready for manual review.

## Additional Resources

- [scikit-learn Documentation](https://scikit-learn.org/stable/)
- [Pandas Documentation](https://pandas.pydata.org/docs/)
- [NumPy Documentation](https://numpy.org/doc/stable/)


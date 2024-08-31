# Data Cleaning Process for Sales Trends Analysis Project

## Overview

This repository documents the detailed and systematic data cleaning process undertaken for the Sales Trends Analysis Project. The goal was to ensure that the dataset was prepared for accurate analysis and modeling, leading to reliable insights and forecasts.

## Dataset

- **Source**: The dataset consists of sales transaction data from an online retail store.
- **Key Features**: 
  - `Invoice_Id`
  - `StockCode`
  - `Description`
  - `Quantity`
  - `Invoice_date`
  - `Price`
  - `Customer_Id`
  - `Country`
  - Additional time-based features such as `Year`, `Month`, `Day`, `Weekday`, `Quarter`, etc.

## Data Cleaning Steps

### 1. Handling Missing Values

- **`Description` Column**: This column had 1,453 missing values, which were dropped since the product description is crucial for analysis.
- **`Customer_Id` Column**: With 135,034 missing values, rows missing customer IDs were dropped, ensuring accurate customer segmentation and analysis.

### 2. Removing Duplicates

- Duplicate rows were identified and removed to prevent any bias in the analysis.

### 3. Outlier Detection and Treatment

- **Quantity**: Outliers were identified based on extreme values in `Quantity`. Records with unusually high or low quantities were analyzed and treated accordingly.
- **Price**: Outliers in the `Price` column were also identified and handled to prevent skewed results.

### 4. Data Type Conversions

- **Date/Time Conversion**: The `Invoice_date` column was converted to `datetime` format to facilitate time-based analysis.
- **Numeric Conversion**: Columns such as `Quantity` and `Price` were ensured to be in the correct numeric format for accurate calculations.

### 5. Feature Engineering

- **Time-Based Features**: Additional features such as `Year`, `Month`, `Day`, `Weekday`, `Quarter`, and `Season` were created to enhance the analysis.
- **Lag Features**: Lag features (`lag_1`, `lag_7`, `lag_30`) were created to capture historical sales patterns.
- **Rolling Statistics**: Rolling mean and sum features were created for smoothing and trend analysis over time.

### 6. Data Integrity Checks

- **Consistency**: Ensured consistency across all columns, particularly ensuring that `Quantity` and `Price` values made sense within the context of the sales data.
- **Range Validation**: Verified that all numeric values fell within expected ranges to prevent errors in downstream analysis.

### 7. Saving the Cleaned Data

- The cleaned and feature-engineered dataset was saved for subsequent analysis and modeling, ensuring it was in an optimal state for further processing.

## Results

The data cleaning process resulted in a robust, clean dataset ready for exploratory data analysis (EDA), modeling, and forecasting. By systematically addressing missing values, outliers, and ensuring data consistency, we established a strong foundation for accurate and insightful analysis.

## Next Steps

- **Exploratory Data Analysis (EDA)**: Analyzing trends, patterns, and relationships within the cleaned dataset.
- **Modeling**: Implementing and tuning models (e.g., ARIMA, XGBoost) for sales forecasting.
- **Visualization**: Creating compelling visualizations to communicate findings effectively.

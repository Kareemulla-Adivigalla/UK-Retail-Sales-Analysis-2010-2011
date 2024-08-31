# UK-Retail-Sales-Analysis-2010-2011

## Project Overview

This project focuses on analyzing retail sales data from a UK-based online store, covering transactions between 2010 and 2011. The analysis provides insights into sales trends, customer behavior, and seasonality, helping to inform strategic decisions in inventory management, marketing, and operations.

## Objective

The primary objective of this project is to analyze sales trends over time to understand overall sales performance, identify peak sales periods, and uncover seasonal variations. The goal is to provide actionable insights for inventory management, marketing strategies, and operational planning.

## Data Source

The dataset for this project was collected from a publicly available source on Kaggle. The original dataset can be accessed via the following link:

[Retail Transactions Online Sales Dataset on Kaggle](https://www.kaggle.com/datasets/shashanks1202/retail-transactions-online-sales-dataset)

## Tools and Technologies

The following tools and technologies were utilized throughout the project:

- **Python**: Data cleaning, EDA, modeling, and analysis.
- **Pandas**: Data manipulation and analysis.
- **NumPy**: Numerical computations.
- **Matplotlib & Seaborn**: Data visualization.
- **SQL**: Data querying and manipulation.
- **Power BI**: Dashboard creation and visualization.
- **Git & GitHub**: Version control and project repository.

## Project Phases

### 1. Data Cleaning

The first step involved thorough data cleaning to ensure the dataset was ready for analysis:

- **Handling Missing Values**: The dataset had 1,453 missing values in the `Description` column and 135,034 missing values in the `Customer_Id` column. Missing values were addressed using appropriate imputation techniques.
- **Data Consistency**: Ensured consistency in data entries, correcting typos, and standardizing formats for dates and categorical variables.
- **Outlier Detection**: Identified and handled outliers in the `Quantity` and `Price` columns to avoid skewing the analysis.
- **Feature Engineering**: Added new features such as `Year`, `Month`, `Day`, `DayOfWeek`, `Hour`, `Weekday`, `Quarter`, `Total_Sales`, `Week`, `Season`, and `Is_Christmas_Season` to facilitate more detailed analysis.

### 2. Feature Engineering Process

#### a. **Year, Month, and Day Features**
- **Year**: Extracted from the `Invoice_date` to capture yearly trends.
- **Month**: Extracted from the `Invoice_date` to analyze monthly sales patterns and seasonality.
- **Day**: Extracted from the `Invoice_date` to investigate daily sales patterns and their fluctuations.

#### b. **Weekday Feature**
- **Weekday**: Extracted the day of the week (e.g., Monday, Tuesday) from the `Invoice_date` to explore how sales vary by day. This helped identify patterns like higher sales on weekends.

#### c. **Quarter Feature**
- **Quarter**: Derived from the `Invoice_date` to understand quarterly trends. This was particularly useful in identifying spikes in sales during specific quarters, such as Q4 for holiday shopping.

#### d. **Season Feature**
- **Season**: Created a seasonal feature by mapping months to seasons (e.g., Winter, Spring, Summer, Fall). This feature was instrumental in analyzing sales patterns across different times of the year.

### 3. SQL Analysis Process

#### a. **Database Setup**
- Imported the sales data into SQL Server, creating a table named `updated_sales_dataset_with_features`.
- Established the database connection using SQL Server Management Studio (SSMS).

#### b. **Data Preparation**
- **Handling Missing Values**: Imputed missing values in key columns using the mean values to ensure the dataset was complete for analysis.
- **Renaming Columns for Clarity**: Renamed columns to follow a consistent naming convention with underscores, improving readability and making the dataset easier to work with.

### 4. Exploratory Data Analysis (EDA)

#### a. **Initial Data Exploration**
- **Data Loading**: The dataset was loaded and inspected to understand its structure and contents.
- **Summary Statistics**: Descriptive statistics (mean, median, standard deviation) were calculated for key variables such as `Total_Sales`, `Quantity`, and `Price`.
- **Missing Values**: A thorough check for missing values was conducted, and missing data was handled based on the importance of the variable (e.g., dropping rows, imputing values).

#### b. **Data Visualization**

##### i. **Sales Trends Over Time**
- **Monthly Sales Analysis**: A line chart was created to visualize the total sales by month, revealing trends and seasonal patterns over time. 
- Key findings: Sales demonstrated a noticeable seasonal trend, with peaks during specific months that could be linked to holidays or promotions.
- **Quarterly Sales Analysis**: Total sales were aggregated by quarter and visualized to understand broader trends. 
- Key findings: A consistent upward trend was observed on a quarterly basis, with notable increases in Q4, likely driven by holiday shopping.

##### ii. **Sales by Day of the Week**
- **Weekday Sales Analysis**: Sales were grouped by day of the week to identify which days contributed most to total sales. 
- Key findings: Sales were highest on weekends, with a noticeable dip during mid-week days.

##### iii. **Sales by Season**
- **Seasonal Sales Analysis**: A bar chart was created to visualize total sales by season (Winter, Spring, Summer, Fall). 
- Key findings: Sales were highest during the Fall season, likely due to holiday shopping, followed by steady sales in other seasons.

#### c. **Correlation Analysis**
- **Correlation Heatmap**: A heatmap was generated to explore the relationships between `Total_Sales`, `Quantity`, `Price`, and time-based features such as `Month`, `Quarter`, and `DayOfWeek`.
  - Key findings: 
    - Strong correlations were observed between `Total_Sales` and `Quantity`, indicating that higher quantities sold directly contributed to higher sales.
    - No significant correlations were found between `Total_Sales` and specific days of the week, suggesting that sales were not strongly dependent on the day itself.

### 5. Modeling and Analysis

Prophet predictive models were built to forecast future sales and provide actionable insights:

- **Weekly Sales Forecasting**: Sales were forecasted to increase from £0.18 million in Week 1 (December 18, 2011) to £0.20 million in Week 6 (January 22, 2012). Accuracy was measured using MAE and RMSE.
- **Monthly Sales Forecasting**: Projected sales growth from £0.69 million in January 2012 to £0.81 million in June 2012. Prediction intervals were calculated to provide confidence in the forecasts.
- **Quarterly Sales Forecasting**: Predicted growth from £2.44 million in Q1 2012 to £3.53 million in Q4 2012, with scenario planning based on forecast ranges.

### 6. Dashboarding

A visually appealing Power BI dashboard was created to effectively communicate the findings:

#### a. **Visualizations**
- **Sales Overview**:
  - **Line Chart**: "How did sales trend across the months?"
  - **Bar Chart**: "Which countries had the highest sales?"

- **Peak Period Analysis**:
  - **Clustered Bar Chart**: "Which days had the highest sales?"
  - **Funnel Chart**: "At what time of day were sales the highest?"

- **Seasonal Analysis**:
  - **Line Chart**: "How did sales change each quarter?"
  - **Pie Chart**: "Which season had the highest sales?"

#### b. **Dashboard Layout**
- **Page 1**: Overview of KPIs and Sales Trends.
- **Page 2**: Detailed Peak Period Analysis.
- **Page 3 & 4**: Insights & Recommendations.

### 7. Interpretation and Actionable Insights

The final phase involved interpreting the results and providing actionable recommendations:

- **Maximizing Revenue**: Increasing inventory and marketing efforts leading up to November and December. Extend Black Friday promotions to cover November.
- **Targeted Promotions**: Implementing mid-winter sales in February to counter low sales. Introduce “Sunday Saver” promotions to boost Sunday sales.
- **Leveraging Peak Days**: Utilizing Thursdays for major product launches and special sales campaigns. Schedule ads and promotions during peak purchasing times (12 PM to 1 PM).
- **Seasonal Planning**: Planning major product launches in the Fall and prioritize stock levels ahead of Q4 to capitalize on peak sales. Developed Christmas-themed promotions to elevate holiday sales.

## Achievements

- Successfully cleaned and prepared a large dataset for analysis, ensuring data quality and consistency.
- Conducted in-depth EDA to uncover key sales trends, customer behavior, and seasonal patterns.
- Built predictive models to forecast future sales, providing valuable insights for strategic decision-making.
- Created a comprehensive Power BI dashboard that effectively communicated the findings to stakeholders.
- Provided actionable recommendations that can be implemented to optimize sales performance, inventory management, and marketing strategies.



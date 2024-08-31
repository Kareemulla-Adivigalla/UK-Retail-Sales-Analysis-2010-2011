# Power BI Dashboard: Sales Trends Analysis

## Overview
This Power BI dashboard provides an in-depth analysis of sales trends, peak sales periods, and seasonal variations for a UK-based online retail dataset. The goal is to offer actionable insights that inform inventory management, marketing strategies, and operational planning.

## Dashboard Objectives
1. **Analyze sales trends** over time.
2. **Identify peak sales periods** by day, month, and hour.
3. **Uncover seasonal variations** to optimize business strategies.

## Dashboard Setup Process

### 1. **Data Preparation**
   - **Data Source**: `updated_sales_dataset_with_features.csv`
   - **Columns**: Invoice_Id, StockCode, Description, Quantity, Invoice_date, Price, Customer_Id, Country, Year, Month, Day, DayOfWeek, Hour, Weekday, Quarter, Total_Sales, Week, Season, Is_Christmas_Season
   - **Data Cleaning**: Removed duplicates, handled missing values, and ensured data consistency.

### 2. **KPI Creation**
   - **Total Sales**:
     ```dax
     Total_Sales = SUM(updated_sales_dataset_with_features[Total_Sales])
     ```

   - **Average Sales Per Month**:
     ```dax
     Average_Sales_Per_Month = 
     AVERAGEX(
         SUMMARIZE(
             updated_sales_dataset_with_features,
             updated_sales_dataset_with_features[Year],
             updated_sales_dataset_with_features[Month],
             "Monthly_Sales", SUM(updated_sales_dataset_with_features[Total_Sales])
         ),
         [Monthly_Sales]
     )
     ```

   - **Top 2 Days Per Month (Day Number) with Max Sales**:
     ```dax
     Top_2_Days_Per_Month = 
     CONCATENATEX(
         TOPN(
             2,
             SUMMARIZE(
                 updated_sales_dataset_with_features,
                 updated_sales_dataset_with_features[Month],
                 updated_sales_dataset_with_features[Day],
                 "Total_Sales", SUM(updated_sales_dataset_with_features[Total_Sales])
             ),
             [Total_Sales],
             DESC
         ),
         FORMAT(updated_sales_dataset_with_features[Day], "0"),
         ", "
     )
     ```

   - **Top 2 Days with Max Sales**:
     ```dax
     Top_2_Days_Max_Sales = 
     CONCATENATEX(
         TOPN(
             2,
             SUMMARIZE(
                 updated_sales_dataset_with_features,
                 updated_sales_dataset_with_features[Weekday],
                 "Total_Sales", SUM(updated_sales_dataset_with_features[Total_Sales])
             ),
             [Total_Sales],
             DESC
         ),
         updated_sales_dataset_with_features[Weekday],
         ", "
     )
     ```

   - **Peak Day Name with Max Sales**:
     ```dax
     Peak_Day_Name_Max_Sales = 
     CALCULATE(
         VALUES(updated_sales_dataset_with_features[Weekday]),
         TOPN(
             1,
             SUMMARIZE(
                 updated_sales_dataset_with_features,
                 updated_sales_dataset_with_features[Weekday],
                 "Total_Sales", SUM(updated_sales_dataset_with_features[Total_Sales])
             ),
             [Total_Sales],
             DESC
         )
     )
     ```

   - **Peak Hour with Max Sales (12-Hour Format with AM/PM)**:
     ```dax
     Peak_Hour_Max_Sales_AM_PM = 
     VAR PeakHour = 
         CALCULATE(
             VALUES(updated_sales_dataset_with_features[Hour]),
             TOPN(
                 1,
                 SUMMARIZE(
                     updated_sales_dataset_with_features,
                     updated_sales_dataset_with_features[Hour],
                     "Total_Sales", SUM(updated_sales_dataset_with_features[Total_Sales])
                 ),
                 [Total_Sales],
                 DESC
             )
         )
     RETURN
         IF(
             PeakHour >= 12,
             IF(PeakHour = 12, "12 PM", FORMAT(PeakHour - 12, "0") & " PM"),
             IF(PeakHour = 0, "12 AM", FORMAT(PeakHour, "0") & " AM")
         )
     ```

   - **Average Sales Per Weekday**:
     ```dax
     Average_Sales_Per_Weekday = 
     AVERAGEX(
         SUMMARIZE(
             updated_sales_dataset_with_features,
             updated_sales_dataset_with_features[Weekday],
             "Total_Sales_Per_Weekday", SUM(updated_sales_dataset_with_features[Total_Sales])
         ),
         [Total_Sales_Per_Weekday]
     )
     ```

   - **Total Count of Transactions**:
     ```dax
     Total_Transactions = COUNTROWS(updated_sales_dataset_with_features)
     ```

### 3. **Visualizations**
   - **Sales Overview**:
     - **Line Chart**: "How did sales trend across the months?"
     - **Bar Chart**: "Which countries had the highest sales?"

   - **Peak Period Analysis**:
     - **Clustered Bar Chart**: "Which days had the highest sales?"
     - **Funnel Chart**: "At what time of day were sales the highest?"

   - **Seasonal Analysis**:
     - **Line Chart**: "How did sales change each quarter?"
     - **Pie Chart**: "Which season had the highest sales?"

### 4. **Dashboard Layout**
   - **Page 1**: Overview of KPIs and Sales Trends.
   - **Page 2**: Detailed Peak Period Analysis.
   - **Page 3&4**: Insights & Recommendations.

## Conclusion
This Power BI dashboard provides a comprehensive view of sales trends, helping to identify key periods of high sales and uncover seasonal patterns. The actionable insights derived from this analysis can support better business decisions in inventory management, marketing strategies, and overall operational planning.

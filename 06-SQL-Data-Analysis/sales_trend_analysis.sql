use Kaggle;
select * from updated_sales_dataset_with_features;
select count(*) as Total_Transactions from updated_sales_dataset_with_features;

----Sales Overview

--- What are the total sales by month?
SELECT MONTH,
SUM(Total_Sales) AS Total_Monthly_Sales
FROM updated_sales_dataset_with_features
GROUP BY MONTH
ORDER BY Total_Monthly_Sales DESC;

---- What are the total sales by quarter?
SELECT QUARTER,
SUM(Total_Sales) AS Total_Quarterly_Sales
FROM updated_sales_dataset_with_features
GROUP BY Quarter
Order by Total_Quarterly_Sales DESC;

----What are the total sales by year?
SELECT Year,
SUM(Total_Sales) AS Total_Yearly_Sales
FROM updated_sales_dataset_with_features
Group by Year
Order by Total_Yearly_Sales desc;

----Peak Sales Periods

-----What are the peak sales days, where sales exceed a certain percentage above the average?
-- Calculate average daily sales
WITH Avg_Daily_Sales AS (
    SELECT 
        AVG(Total_Sales) AS Avg_Sales
    FROM 
        updated_sales_dataset_with_features
)
-- Identify peak sales days where sales exceed 25% above the average
SELECT 
    Invoice_date, 
    Total_Sales
FROM 
    updated_sales_dataset_with_features
WHERE 
    Total_Sales > (SELECT Avg_Sales * 1.25 FROM Avg_Daily_Sales)
ORDER BY 
    Total_Sales DESC;


----What are the total sales by day of the week?
SELECT 
    Weekday, 
    SUM(Total_Sales) AS Total_Weekday_Sales
FROM 
    updated_sales_dataset_with_features
GROUP BY 
    Weekday
ORDER BY 
Total_Weekday_Sales DESC;


----What are the peak sales periods in a month?
SELECT 
    Year, 
    Month, 
    Day, 
    SUM(Total_Sales) AS Daily_Sales
FROM 
    updated_sales_dataset_with_features
GROUP BY 
    Year, Month, Day
HAVING 
    SUM(Total_Sales) > (SELECT AVG(Total_Sales) * 1.25 FROM updated_sales_dataset_with_features)
ORDER BY 
    Daily_Sales DESC;

----Seasonal Variations

----How do sales vary across different months and quarters?
SELECT 
    Month, 
    SUM(Total_Sales) AS Total_Monthly_Sales
FROM 
    updated_sales_dataset_with_features
GROUP BY 
    Month
ORDER BY 
    Month DESC;

---- Sales by quarter
SELECT 
    Quarter, 
    SUM(Total_Sales) AS Total_Quarterly_Sales
FROM 
    updated_sales_dataset_with_features
GROUP BY 
    Quarter
ORDER BY 
    Quarter DESC;

-- Sales by season
SELECT 
    Season, 
    SUM(Total_Sales) AS Total_Seasonal_Sales
FROM 
    updated_sales_dataset_with_features
GROUP BY 
    Season
ORDER BY Total_Seasonal_Sales DESC;


----Sales Trends Analysis
-- Investigating peak sales periods for specific factors
-- Analyzing peak sales around Christmas
SELECT 
    Year, 
    Month, 
    SUM(Total_Sales) AS Sales_Around_Christmas
FROM 
    updated_sales_dataset_with_features
WHERE 
    Is_Christmas_Season = 1
GROUP BY 
    Year, Month
ORDER BY 
    Year, Month;


----Imputation with Mean for NULL Columns

-- Calculate the mean for Lag_7 and update NULLs
WITH Mean_Lag_7 AS (
    SELECT 
        AVG(Lag_7) AS Mean_Lag_7
    FROM 
        updated_sales_dataset_with_features
    WHERE 
        Lag_7 IS NOT NULL
)
UPDATE updated_sales_dataset_with_features
SET Lag_7 = (SELECT Mean_Lag_7 FROM Mean_Lag_7)
WHERE Lag_7 IS NULL;

select * from updated_sales_dataset_with_features;

-- Calculate the mean for Lag_30 and update NULLs
WITH Mean_Lag_30 AS (
    SELECT 
        AVG(Lag_30) AS Mean_Lag_30
    FROM 
        updated_sales_dataset_with_features
    WHERE 
        Lag_30 IS NOT NULL
)
UPDATE updated_sales_dataset_with_features
SET Lag_30 = (SELECT Mean_Lag_30 FROM Mean_Lag_30)
WHERE Lag_30 IS NULL;

select * from updated_sales_dataset_with_features;


-- Calculate the mean for Rolling_Mean_7 and update NULLs
WITH Mean_Rolling_Mean_7 AS (
    SELECT 
        AVG(Rolling_Mean_7) AS Mean_Rolling_Mean_7
    FROM 
        updated_sales_dataset_with_features
    WHERE 
        Rolling_Mean_7 IS NOT NULL
)
UPDATE updated_sales_dataset_with_features
SET Rolling_Mean_7 = (SELECT Mean_Rolling_Mean_7 FROM Mean_Rolling_Mean_7)
WHERE Rolling_Mean_7 IS NULL;

-- Calculate the mean for Rolling_Mean_30 and update NULLs
WITH Mean_Rolling_Mean_30 AS (
    SELECT 
        AVG(Rolling_Mean_30) AS Mean_Rolling_Mean_30
    FROM 
        updated_sales_dataset_with_features
    WHERE 
        Rolling_Mean_30 IS NOT NULL
)
UPDATE updated_sales_dataset_with_features
SET Rolling_Mean_30 = (SELECT Mean_Rolling_Mean_30 FROM Mean_Rolling_Mean_30)
WHERE Rolling_Mean_30 IS NULL;

-- Calculate the mean for Rolling_Sum_7 and update NULLs
WITH Mean_Rolling_Sum_7 AS (
    SELECT 
        AVG(Rolling_Sum_7) AS Mean_Rolling_Sum_7
    FROM 
        updated_sales_dataset_with_features
    WHERE 
        Rolling_Sum_7 IS NOT NULL
)
UPDATE updated_sales_dataset_with_features
SET Rolling_Sum_7 = (SELECT Mean_Rolling_Sum_7 FROM Mean_Rolling_Sum_7)
WHERE Rolling_Sum_7 IS NULL;


-- Calculate the mean for Rolling_Sum_30 and update NULLs
WITH Mean_Rolling_Sum_30 AS (
    SELECT 
        AVG(Rolling_Sum_30) AS Mean_Rolling_Sum_30
    FROM 
        updated_sales_dataset_with_features
    WHERE 
        Rolling_Sum_30 IS NOT NULL
)
UPDATE updated_sales_dataset_with_features
SET Rolling_Sum_30 = (SELECT Mean_Rolling_Sum_30 FROM Mean_Rolling_Sum_30)
WHERE Rolling_Sum_30 IS NULL;

select * from updated_sales_dataset_with_features;


-- Calculate the mean for Lag_1 and update NULLs
WITH Mean_Lag_1 AS (
    SELECT 
        AVG(Lag_1) AS Mean_Lag_1
    FROM 
        updated_sales_dataset_with_features
    WHERE 
        Lag_1 IS NOT NULL
)
UPDATE updated_sales_dataset_with_features
SET Lag_1 = (SELECT Mean_Lag_1 FROM Mean_Lag_1)
WHERE Lag_1 IS NULL;


-- Renaming columns for better understanding of the data
EXEC sp_rename 'updated_sales_dataset_with_features.InvoiceID', 'invoice_id', 'COLUMN';
EXEC sp_rename 'updated_sales_dataset_with_features.ProductCode', 'product_code', 'COLUMN';
EXEC sp_rename 'updated_sales_dataset_with_features.ProductDescription', 'product_description', 'COLUMN';
EXEC sp_rename 'updated_sales_dataset_with_features.QuantitySold', 'quantity_sold', 'COLUMN';
EXEC sp_rename 'updated_sales_dataset_with_features.SaleDate', 'sale_date', 'COLUMN';
EXEC sp_rename 'updated_sales_dataset_with_features.UnitPrice', 'unit_price', 'COLUMN';
EXEC sp_rename 'updated_sales_dataset_with_features.CustomerID', 'customer_id', 'COLUMN';
EXEC sp_rename 'updated_sales_dataset_with_features.Country', 'country', 'COLUMN';
EXEC sp_rename 'updated_sales_dataset_with_features.Year', 'sale_year', 'COLUMN';
EXEC sp_rename 'updated_sales_dataset_with_features.Month', 'sale_month', 'COLUMN';
EXEC sp_rename 'updated_sales_dataset_with_features.Day', 'sale_day', 'COLUMN';
EXEC sp_rename 'updated_sales_dataset_with_features.DayOfWeek', 'sale_day_of_week', 'COLUMN';
EXEC sp_rename 'updated_sales_dataset_with_features.Hour', 'sale_hour', 'COLUMN';
EXEC sp_rename 'updated_sales_dataset_with_features.Weekday', 'sale_weekday', 'COLUMN';
EXEC sp_rename 'updated_sales_dataset_with_features.Quarter', 'sale_quarter', 'COLUMN';
EXEC sp_rename 'updated_sales_dataset_with_features.TotalSalesAmount', 'total_sales_amount', 'COLUMN';
EXEC sp_rename 'updated_sales_dataset_with_features.Week', 'sale_week', 'COLUMN';
EXEC sp_rename 'updated_sales_dataset_with_features.Season', 'sale_season', 'COLUMN';
EXEC sp_rename 'updated_sales_dataset_with_features.Is_Christmas_Season', 'is_christmas_season', 'COLUMN';
EXEC sp_rename 'updated_sales_dataset_with_features.SalesLag1Day', 'sales_lag_1_day', 'COLUMN';
EXEC sp_rename 'updated_sales_dataset_with_features.SalesLag7Days', 'sales_lag_7_days', 'COLUMN';
EXEC sp_rename 'updated_sales_dataset_with_features.SalesLag30Days', 'sales_lag_30_days', 'COLUMN';
EXEC sp_rename 'updated_sales_dataset_with_features.7DaySalesAverage', 'sales_7_day_average', 'COLUMN';
EXEC sp_rename 'updated_sales_dataset_with_features.30DaySalesAverage', 'sales_30_day_average', 'COLUMN';
EXEC sp_rename 'updated_sales_dataset_with_features.7DaySalesTotal', 'sales_7_day_total', 'COLUMN';
EXEC sp_rename 'updated_sales_dataset_with_features.30DaySalesTotal', 'sales_30_day_total', 'COLUMN';


SELECT 
    COLUMN_NAME AS ColumnName, 
    DATA_TYPE AS DataType, 
    CHARACTER_MAXIMUM_LENGTH AS MaxLength, 
    IS_NULLABLE AS IsNullable
FROM 
    INFORMATION_SCHEMA.COLUMNS
WHERE 
    TABLE_NAME = 'updated_sales_dataset_with_features'
ORDER BY 
    ORDINAL_POSITION;


select * from updated_sales_dataset_with_features;


-- Select and sort the data by sale_date
SELECT 
    invoice_id,
    product_code,
    product_description,
    quantity_sold,
    sale_date,
    unit_price,
    customer_id,
    country,
    sale_year,
    sale_month,
    sale_day,
    sale_day_of_week,
    sale_hour,
    sale_weekday,
    sale_quarter,
    total_sales_amount,
    sale_week,
    sale_season,
    is_christmas_season,
    sales_lag_1_day,
    sales_lag_7_days,
    sales_lag_30_days,
    sales_7_day_average,
    sales_30_day_average,
    sales_7_day_total,
    sales_30_day_total
FROM 
    updated_sales_dataset_with_features
ORDER BY 
    sale_date;


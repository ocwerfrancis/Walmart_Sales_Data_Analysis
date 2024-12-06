-- GENERAL ANALYSIS-----------------------------------
-- How many unique cities does the data have?
SELECT
    DISTINCT city
FROM
    sales;

-- In which city is each branch
SELECT
    DISTINCT city,
    branch
FROM
    sales;

-- PRODUCT ANALYSIS-----------------------------------
-- How many unique product lines does the data have?
SELECT
    DISTINCT product_line
FROM
    sales;

-- What is the most common payment method?
SELECT
    payment,
    COUNT(*) AS payment_count
FROM
    sales
GROUP BY
    payment
ORDER BY
    payment_count DESC;

-- What is the most selling product line?
SELECT
    product_line,
    SUM(quantity) AS product_sold
FROM
    sales
GROUP BY
    product_line
ORDER BY
    product_sold DESC;

-- What is the total revenue by month?
SELECT 
    month_name AS month,
    ROUND(SUM(total)) AS total_revenue
FROM
    sales
GROUP BY
    month_name
ORDER BY
    total_revenue DESC;

-- What month had the largest COGS
SELECT
    month_name AS month,
    ROUND(SUM(cogs)) AS cogs
FROM
    sales
GROUP BY
    month_name
ORDER BY
    cogs DESC;

-- What product line had the largest revenue?
SELECT
    product_line,
    ROUND(SUM(total)) as total_revenue
FROM
    sales
GROUP BY
    product_line
ORDER BY
    total_revenue DESC;

-- What is the city with the largest revenue?
SELECT
    city,
    branch,
    ROUND(SUM(total)) AS total_revenue
FROM
    sales
GROUP BY
    city, branch
ORDER BY
    total_revenue DESC;

-- What product line had the largest VAT?
SELECT
    product_line,
    ROUND(AVG(tax_pct)) as avg_tax
FROM
    sales
GROUP BY
    product_line
ORDER BY
    avg_tax DESC;

-- Fetch each product line and add a column to those product line showing "Good", "Bad". 
-- Good if its greater than average sales
SELECT
    product_line,
    CASE
        WHEN AVG(quantity) > 6 THEN 'Good'
        ELSE 'Bad'
    END AS product_status
FROM
    sales
GROUP BY
    product_line;

-- Which branch sold more products than average product sold?
SELECT
    branch,
    SUM(quantity) AS total_sold
FROM
    sales
GROUP BY
    branch
HAVING
    SUM(quantity) > (SELECT AVG(quantity) FROM sales)

-- What is the most common product line by gender?
SELECT
    product_line,
    gender,
    COUNT(gender) AS gender_count
FROM
    sales
GROUP BY
    product_line, gender
ORDER BY
    gender_count DESC;

-- What is the average rating of each product line?
SELECT
    product_line,
    AVG(rating) AS avg_rating
FROM
    sales
GROUP BY
    product_line
ORDER BY
    avg_rating DESC;


-- -----------------SALES ANALYSIS --------------------------------
-- Number of sales made in each time of the day per weekday
SELECT
    time_of_day,
    day_name,
    COUNT(*) AS total_sales
FROM
    sales
GROUP BY
    time_of_day, day_name
ORDER BY
    total_sales DESC;

-- Which of the customer types brings the most revenue?
SELECT
    customer_type,
    ROUND(SUM(total)) AS total_revenue
FROM
    sales
GROUP BY
    customer_type
ORDER BY
    total_revenue DESC;

-- Which city has the largest tax percent/ VAT (**Value Added Tax**)?
SELECT
    city,
    ROUND(AVG(tax_pct)) AS avg_tax
FROM
    sales
GROUP BY
    city
ORDER BY
    avg_tax DESC;

-- Which customer type pays the most in VAT?
SELECT
    customer_type,
    ROUND(AVG(tax_pct)) AS avg_tax
FROM
    sales
GROUP BY
    customer_type
ORDER BY
    avg_tax DESC;

-- -----------------CUSTOMER ANALYSIS--------------------------------
--  How many unique customer types does the data have?
SELECT
    DISTINCT customer_type
FROM
    sales;

-- How many customers are there in each city?
SELECT
    city,
    COUNT(*) AS customer_count
FROM
    sales
GROUP BY
    city
ORDER BY
    customer_count DESC;

-- Which customer type buys the most?
SELECT
    customer_type,
    COUNT(*) AS customer_count
FROM
    sales
GROUP BY
    customer_type
ORDER BY
    customer_count DESC;

-- How many unique payment methods does the data have?
SELECT 
    DISTINCT payment
FROM
    sales;

-- What is the gender of most of the customers?
SELECT
    gender,
    COUNT(*) AS gender_count
FROM
    sales
GROUP BY
    gender
ORDER BY
    gender_count DESC;

-- What is the gender distribution per branch
SELECT
    branch,
    gender,
    COUNT(*) AS gender_count
FROM
    sales
GROUP BY
    branch, gender
ORDER BY
    gender_count DESC;

-- Which time of the day do customers give most ratings?
SELECT
    time_of_day,
    AVG(rating) AS avg_rating
FROM
    sales
GROUP BY
    time_of_day
ORDER BY avg_rating DESC;

-- Which time of the day do customers give most ratings per branch?
SELECT
    time_of_day,
    branch,
    AVG(rating) AS avg_rating
FROM
    sales
GROUP BY
    time_of_day,branch
ORDER BY
    avg_rating DESC;

-- Which day of the week has the best avg ratings?
SELECT
    day_name,
    AVG(rating) AS avg_rating
FROM
    sales
GROUP BY
    day_name
ORDER BY
    avg_rating DESC;

-- Which day of the week has the best average ratings per branch?
SELECT
    day_name,
    branch,
    AVG(rating) AS avg_rating
FROM
    sales
GROUP BY
    day_name, branch
ORDER BY
    avg_rating DESC;


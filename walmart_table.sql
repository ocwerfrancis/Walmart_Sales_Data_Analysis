-- Active: 1730799087164@@127.0.0.1@5432@walmartsales@public
-- Create a database
CREATE DATABASE walmartSales;

-- Create a table
CREATE TABLE  sales (
    invoice_id VARCHAR(30) NOT NULL PRIMARY KEY,
    branch VARCHAR(5) NOT NULL,
    city VARCHAR(30) NOT NULL,
    customer_type VARCHAR(30) NOT NULL,
    gender VARCHAR(30) NOT NULL,
    product_line VARCHAR(100) NOT NULL,
    unit_price NUMERIC(10,2) NOT NULL,
    quantity INT NOT NULL,
    tax_pct REAL NOT NULL,
    total NUMERIC(12, 4) NOT NULL,
    date TIMESTAMP NOT NULL,
    time TIME NOT NULL,
    payment VARCHAR(15) NOT NULL,
    cogs NUMERIC(10,2) NOT NULL,
    gross_margin_pct REAL,
    gross_income NUMERIC(12, 4),
    rating REAL
);

-- DATA CLEANING
SELECT * FROM sales;

-- Add time_of_day column to the table

SELECT
    date,
    (
        CASE
            WHEN time BETWEEN '00:00:00' AND '12:00:00' THEN 'Morning'
            WHEN time BETWEEN '12:01:00' AND '16:00:00' THEN 'Afternoon'
            ELSE 'Evening'
        END
    )AS time_of_day
FROM
    sales;

ALTER TABLE sales ADD COLUMN time_of_day VARCHAR(20);

UPDATE sales
SET time_of_day = (
    CASE
        WHEN time BETWEEN '00:00:00' AND '12:00:00' THEN 'Morning'
        WHEN time BETWEEN '12:01:00' AND '16:00:00' THEN 'Afternoon'
        ELSE 'Evening'
    END
);

-- Add day_name to the table

SELECT
    date,
    TO_CHAR(date,'Day') AS day_name
FROM
    sales;

ALTER TABLE sales ADD COLUMN day_name VARCHAR(10);

UPDATE sales
SET day_name = TO_CHAR(date,'Day');

-- Add month_name to the table

SELECT
    date,
    TO_CHAR(date,'Month') AS month_name
FROM
    sales;

ALTER TABLE sales ADD COLUMN month_name VARCHAR(10);

UPDATE sales
SET month_name = TO_CHAR(date,'Month');


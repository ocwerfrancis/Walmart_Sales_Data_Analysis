import plotly.express as px
import pandas as pd
import os
from database import fetch_data

# SQL query to get total revenue per month
query = """
SELECT 
    month_name AS month,
    ROUND(SUM(total)) AS total_revenue
FROM
    sales
GROUP BY
    month_name;
"""
df = fetch_data(query)

# Create a bar chart for total revenue by month
fig = px.bar(df, x='month', y='total_revenue',
             title="Total Revenue by Month",
             labels={'month': 'Month', 'total_revenue': 'Total Revenue'},
             color='month',  # Color the bars by month
             text='total_revenue')  # Display the revenue on top of the bars

# Create folder for saving plots if it doesn't exist
output_folder = "visuals"
os.makedirs(output_folder, exist_ok=True)

# Save the Plotly figure as an HTML file
output_path = os.path.join(output_folder, "Total_Revenue_by_Month.html")
try:
    fig.write_html(output_path)  # Save as HTML file with interactivity
    print(f"Plot saved at: {output_path}")
except Exception as e:
    print(f"Error saving the plot: {e}")

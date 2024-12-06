import plotly.express as px
import pandas as pd
import os
from database import fetch_data

# SQL query to get product line and total products sold
query = """
SELECT
    product_line,
    SUM(quantity) AS product_sold
FROM
    sales
GROUP BY
    product_line;
"""
df = fetch_data(query)

# Create a bar chart
fig = px.bar(df, x='product_line', y='product_sold',
             title="Total Products Sold by Product Line",
             labels={'product_line': 'Product Line', 'product_sold': 'Total Products Sold'},
             color='product_line',  # Color the bars by product line
             text='product_sold')  # Display the number of products on top of the bars

# Create folder for saving plots if it doesn't exist
output_folder = "visuals"
os.makedirs(output_folder, exist_ok=True)

# Save the Plotly figure as an HTML file
output_path = os.path.join(output_folder, "Total_Products_Sold_by_Product_Line.html")
try:
    fig.write_html(output_path)  # Save as an interactive HTML file
    print(f"Plot saved at: {output_path}")
except Exception as e:
    print(f"Error saving the plot: {e}")

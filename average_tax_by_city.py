import plotly.express as px
import pandas as pd
import os
from database import fetch_data

# SQL query to get average tax percentage by city
query = """
SELECT
    city,
    ROUND(AVG(tax_pct)) AS avg_tax
FROM
    sales
GROUP BY
    city
ORDER BY
    avg_tax DESC;
"""
df = fetch_data(query)

# Create a bar chart for average tax by city
fig = px.bar(df, x='city', y='avg_tax',
             title="Average Tax Percentage by City",
             labels={'city': 'City', 'avg_tax': 'Average Tax Percentage'},
             color='city',  # Color the bars by city
             text='avg_tax')  # Display the average tax on top of the bars

# Create folder for saving plots if it doesn't exist
output_folder = "visuals"
os.makedirs(output_folder, exist_ok=True)

# Save the Plotly figure as an HTML file
output_path = os.path.join(output_folder, "Average_Tax_by_City.html")
try:
    fig.write_html(output_path)  # Save as HTML file with interactivity
    print(f"Plot saved at: {output_path}")
except Exception as e:
    print(f"Error saving the plot: {e}")

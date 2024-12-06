import plotly.express as px
import pandas as pd
import os
from database import fetch_data

# Fetch data for time of day and weekday
query = """
SELECT day_name, time_of_day, COUNT(*) AS total_sales
FROM sales
GROUP BY day_name, time_of_day
ORDER BY day_name, total_sales DESC;
"""
df = fetch_data(query)

# Create an interactive bar chart
fig = px.bar(df, x='time_of_day', y='total_sales', color='day_name',
             title="Total Sales by Time of Day and Weekday",
             labels={'time_of_day': 'Time of Day', 'total_sales': 'Total Sales'})

# Create folder for saving plots if it doesn't exist
output_folder = "visuals"
os.makedirs(output_folder, exist_ok=True)

# Save the Plotly figure as an HTML file
output_path = os.path.join(output_folder, "Total_sales.html")
try:
    fig.write_html(output_path)  # Save as HTML file with interactivity
    print(f"Plot saved at: {output_path}")
except Exception as e:
    print(f"Error saving the plot: {e}")
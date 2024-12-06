from sqlalchemy import create_engine
import pandas as pd

# database.py
from sqlalchemy import create_engine
import pandas as pd

def fetch_data(query):
    # Correct database connection string
    DATABASE_URL = "postgresql+psycopg2://francis:P%40ss1234@localhost:5432/walmartsales"

    # Create the engine
    engine = create_engine(DATABASE_URL)

    # Read data using Pandas
    df = pd.read_sql_query(query, con=engine)
    return df


import pyspark
from pyspark.sql import SparkSession
from pyspark.sql.functions import sum as _sum, col, rank, when, lit, concat, lpad, current_date, current_timestamp
from pyspark.sql.window import Window

def get_top_style_per_city(
       spark: pyspark.sql.session.SparkSession,
       df_sales:pyspark.sql.DataFrame
) -> pyspark.sql.DataFrame:

       df_results = df_sales

       # Define windows partitioned by city, ordered by total amount in descending order
       window_styles = Window.partitionBy(df_sales.city).orderBy(_sum(df_sales.amount).desc())

       # Calculate total amount for each style per city and assign ranks
       df_results = df_results.withColumn("rank_styles", rank().over(window_styles))

       # Filter to get the top style and category per city
       df_results = df_results.filter(col("rank_styles") == 1)

       # Add additional columns
       df_results = df_results.withColumn("top_style", when(col("style").isNull(), "N/A").otherwise(col("style")))

       # Show the results
       df_results.show()

       return df_results

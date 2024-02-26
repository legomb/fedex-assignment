{{ config(materialized='external', location='results/dim_date.csv') }}

WITH
dates_raw AS (
/* generate dates using the macro from the dbt-utils package */
	{{ dbt_utils.date_spine(
		datepart="day",
		start_date="cast('1970-01-01' AS date)",
		end_date="date_add(current_date(), interval 20 year)"
		)
	}}
),

dates_derived AS (
	SELECT
		date_day AS date,
		CONCAT(
			DATE_PART('year', date_day),
			DATE_PART('month', date_day),
			DATE_PART('day', date_day)
		) AS ansi_date,
		DATE_PART('day', date_day) AS day_of_month,
		DAYNAME(date_day) AS day_name,
		MONTHNAME(date_day) AS month_name,
		DATE_PART('month', date_day) AS month,
		DATE_PART('quarter', date_day) AS quarter,
		DATE_PART('year', date_day) AS year,
		DATE_PART('dayofyear', date_day) AS day_of_year,
		DATE_PART('week', date_day) AS week,
		DATE_PART('weekday', date_day) AS weekday,
		DATE_PART('hour', date_day) AS hour,
		DATE_PART('minute', date_day) AS minute,
		DATE_PART('second', date_day) AS second,
		CASE
			WHEN MONTH(date_day) IN (1, 2, 3) THEN 'Winter'
			WHEN MONTH(date_day) IN (3, 4, 5) THEN 'Spring'
			WHEN MONTH(date_day) IN (6, 7, 8) THEN 'Summer'
			WHEN MONTH(date_day) IN (9, 10, 11) THEN 'Autumn'
		END AS season_northern_hemisphere,
		CASE
			WHEN MONTH(date_day) IN (1, 2, 3) THEN 'Summer'
			WHEN MONTH(date_day) IN (3, 4, 5) THEN 'Autumn'
			WHEN MONTH(date_day) IN (6, 7, 8) THEN 'Winter'
			WHEN MONTH(date_day) IN (9, 10, 11) THEN 'Spring'
		END AS season_southern_hemisphere
	FROM dates_raw
)

SELECT *
FROM
	dates_derived

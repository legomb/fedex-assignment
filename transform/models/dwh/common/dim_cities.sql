{{ config(materialized='external', location='results/dim_cities.csv') }}

WITH cte_clean_customers AS (

	SELECT * FROM {{ ref('clean_customers') }}

)

SELECT
	{{ dbt_utils.generate_surrogate_key(['city']) }} AS id,
	city AS city_name
FROM
	cte_clean_customers

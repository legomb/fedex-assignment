{{ config(materialized='external', location='results/dim_customers.csv') }}

WITH cte_clean_customers AS (

	SELECT * FROM {{ ref('clean_customers') }}

)

SELECT
	{{ dbt_utils.generate_surrogate_key(['customer_code']) }} AS id,
	customer_code,
	customer_name,
	city,
	email,
	phone_number
FROM
	cte_clean_customers

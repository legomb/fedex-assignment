{{ config(materialized='external', location='results/fct_sales.csv') }}

WITH cte_sales_raw AS (

	SELECT * FROM {{ ref('clean_sale') }}

)

SELECT
	{{ dbt_utils.generate_surrogate_key(['sales_code']) }} AS id,
	date AS date_id,
	sales_code,
	product_code,
	customer_code,
	store_code,
	quantity_sold,
	amount
FROM
	cte_sales_raw

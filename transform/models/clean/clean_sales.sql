{{ config(materialized='external', location='results/clean_sales.csv') }}

WITH cte_sales_raw AS (

	SELECT * FROM {{ ref('raw_sales') }}

)

SELECT
	{{ dbt_utils.generate_surrogate_key(["ID"]) }}::VARCHAR AS id,
	"ID"::VARCHAR AS sales_code,
	"ProductID"::VARCHAR AS product_code,
	"CustomerID"::VARCHAR AS customer_code,
	"Date"::DATE AS date,
	"StoreID"::VARCHAR AS store_code,
	"QuantitySold"::INT AS quantity_sold,
	"Amount" AS amount
FROM cte_sales_raw

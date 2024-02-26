{{ config(materialized='external', location='results/clean_sales.csv') }}

WITH cte_sales_raw AS (

	SELECT * FROM {{ ref('raw_sales') }}

)

SELECT
	-- {{ dbt_utils.generate_surrogate_key(['ID']) }} AS id,
	"ID" AS sales_code, -- noqa: RF05
	"ProductID" AS product_code, -- noqa: RF05
	"CustomerID" AS customer_code, -- noqa: RF05: RF06
	CAST("Date" AS DATE) AS date, -- noqa
	"StoreID" AS store_code,
	CAST("QuantitySold" AS INT) AS quantity_sold,
	"Amount" AS amount
FROM cte_sales_raw

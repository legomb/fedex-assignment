WITH cte_sales_raw AS (

	SELECT * FROM {{ ref('clean_sales') }}

)

SELECT
	{{ dbt_utils.generate_surrogate_key(['sales_code']) }} AS id,
	{{ dbt_utils.generate_surrogate_key(['product_code']) }} AS product_id,
	{{ dbt_utils.generate_surrogate_key(['customer_code']) }} AS customer_id,
	{{ dbt_utils.generate_surrogate_key(['store_code']) }} AS store_id,
	CAST(
		CONCAT(
			LPAD(CAST(DATE_PART('year', date) AS VARCHAR), 4, '0'),
			LPAD(CAST(DATE_PART('month', date) AS VARCHAR), 2, '0'),
			LPAD(CAST(DATE_PART('day', date) AS VARCHAR), 2, '0')
		) AS INT
	) AS date_id,
	sales_code,
	quantity_sold,
	amount
FROM
	cte_sales_raw

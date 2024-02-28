WITH cte_clean_sales AS (

	SELECT * FROM {{ ref('clean_sales') }}

)

SELECT
	{{ dbt_utils.generate_surrogate_key(['CAST(CAST(created_timestamp AS DATE) AS VARCHAR)']) }} AS id,
	{{ dbt_utils.generate_surrogate_key(['product_code']) }} AS product_id,
	{{ dbt_utils.generate_surrogate_key(['customer_code']) }} AS customer_id,
	{{ dbt_utils.generate_surrogate_key(['store_code']) }} AS store_id,
	CAST(
		CONCAT(
			LPAD(
				CAST(DATE_PART('year', CAST(created_timestamp AS DATE)) AS VARCHAR), 4, '0'
			),
			LPAD(
				CAST(DATE_PART('month', CAST(created_timestamp AS DATE)) AS VARCHAR), 2, '0'
			),
			LPAD(
				CAST(DATE_PART('day', CAST(created_timestamp AS DATE)) AS VARCHAR), 2, '0'
			)
		) AS INT
	) AS date_id,
	SUM(quantity_sold) AS quantity_sold_total,
	SUM(amount) AS amount_total,
	AVG(amount) AS amount_avg
FROM
	cte_clean_sales
GROUP BY
	CAST(created_timestamp AS DATE),
	product_code,
	customer_code,
	store_code

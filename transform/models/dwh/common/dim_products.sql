WITH cte_clean_products AS (

	SELECT * FROM {{ ref('clean_products') }}

)

SELECT
	{{ dbt_utils.generate_surrogate_key(['product_code']) }} AS id,
	product_code,
	product_name,
	style,
	category,
	manufacturer,
	supplier
FROM
	cte_clean_products

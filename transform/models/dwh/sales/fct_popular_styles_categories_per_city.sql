{{ config(materialized='external', location='results/fct_popular_styles_categories_per_city.csv') }}

WITH cte_clean_sales AS (

	SELECT * FROM {{ ref('clean_sales') }}

),

cte_clean_stores AS (

	SELECT * FROM {{ ref('clean_stores') }}

),

cte_clean_products AS (

	SELECT * FROM {{ ref('clean_products') }}

),

cte_ranked_styles AS (
	SELECT
		cte_clean_stores.city,
		cte_clean_products.style,
		SUM(cte_clean_sales.amount) AS total_amount,
		RANK() OVER (PARTITION BY cte_clean_stores.city ORDER BY SUM(cte_clean_sales.amount) DESC) AS rank
	FROM
		cte_clean_sales
		INNER JOIN cte_clean_stores
			ON cte_clean_sales.store_code = cte_clean_stores.store_code
		INNER JOIN cte_clean_products
			ON cte_clean_sales.product_code = cte_clean_products.product_code
    GROUP BY
		cte_clean_stores.city,
		cte_clean_products.style
),

cte_ranked_categories AS (
    SELECT
		cte_clean_stores.city,
		cte_clean_products.category,
		SUM(cte_clean_sales.amount) AS total_amount,
		RANK() OVER (PARTITION BY cte_clean_stores.city ORDER BY SUM(cte_clean_sales.amount) DESC) AS rank
    FROM
		cte_clean_sales
		INNER JOIN cte_clean_stores
			ON cte_clean_sales.store_code = cte_clean_stores.store_code
		INNER JOIN cte_clean_products
			ON cte_clean_sales.product_code = cte_clean_products.product_code
    GROUP BY
		cte_clean_stores.city,
		cte_clean_products.category
),

cte_cities AS (
	SELECT DISTINCT cte_clean_stores.city
	FROM cte_clean_stores
)

SELECT
	{{ dbt_utils.generate_surrogate_key(['CAST(GET_CURRENT_TIMESTAMP() AS VARCHAR)', 'cte_cities.city']) }} AS id,
	GET_CURRENT_TIMESTAMP() AS snapshot_timestamp,
	CAST(
		CONCAT(
			LPAD(CAST(DATE_PART('year', GET_CURRENT_TIMESTAMP()) AS VARCHAR), 4, '0'),
			LPAD(CAST(DATE_PART('month', GET_CURRENT_TIMESTAMP()) AS VARCHAR), 2, '0'),
			LPAD(CAST(DATE_PART('day', GET_CURRENT_TIMESTAMP()) AS VARCHAR), 2, '0')
		) AS INT
	) AS date_id,
	cte_cities.city,
	COALESCE(cte_ranked_styles.style, 'N/A') AS top_style,
	COALESCE(cte_ranked_styles.total_amount, 0) AS top_style_amount,
	COALESCE(cte_ranked_categories.category, 'N/A') AS top_category,
	COALESCE(cte_ranked_categories.total_amount, 0) AS top_category_amount
FROM
	cte_cities
	LEFT JOIN cte_ranked_styles
		ON 	cte_cities.city = cte_ranked_styles.city
			AND cte_ranked_styles.rank = 1
	LEFT JOIN cte_ranked_categories
		ON 	cte_cities.city = cte_ranked_categories.city
			AND cte_ranked_categories.rank = 1

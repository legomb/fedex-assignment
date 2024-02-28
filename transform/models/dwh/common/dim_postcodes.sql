WITH cte_clean_sales AS (

	SELECT * FROM {{ ref('clean_sales_line_items') }}

)

SELECT
	{{ dbt_utils.generate_surrogate_key(
		[
			'ship_country',
			'ship_state',
			'ship_city',
			'ship_postal_code'
		]) }} AS id,
	ship_country as country,
	ship_state as state,
	ship_city as city,
	ship_postal_code as postal_code
FROM
	cte_clean_sales
GROUP BY
	ship_country,
	ship_state,
	ship_city,
	ship_postal_code

WITH cte_clean_sales AS (

	SELECT * FROM {{ ref('clean_amazon_sales_line_items') }}

)

SELECT
	{{ dbt_utils.generate_surrogate_key(['line_item_code']) }} AS id,
	CAST(
		CONCAT(
			LPAD(CAST(DATE_PART('year', date) AS VARCHAR), 4, '0'),
			LPAD(CAST(DATE_PART('month', date) AS VARCHAR), 2, '0'),
			LPAD(CAST(DATE_PART('day', date) AS VARCHAR), 2, '0')
		) AS INT
	) AS date_id,
	{{ dbt_utils.generate_surrogate_key(
		[
			'ship_country',
			'ship_state',
			'ship_city',
			'ship_postal_code'
		]) }} AS postcode_id,
	line_item_code,
	order_code,
	date,
	status,
	fulfillment,
	sales_channel,
	ship_service_level,
	style,
	sku,
	category,
	size,
	asin,
	courier_status,
	quantity,
	currency,
	amount,
	promotion_ids,
	CASE WHEN b2b IS TRUE THEN 'TRUE' ELSE 'FALSE' END AS b2b,
	fulfilled_by,
	CASE WHEN unnamed_22 IS TRUE THEN 'TRUE' ELSE 'FALSE' END AS unnamed_22
FROM
	cte_clean_sales

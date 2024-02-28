WITH cte_staging_amazon_sales_line_items AS (

	SELECT * FROM {{ ref('staging_amazon_sales_line_items') }}

)

SELECT
	{{ dbt_utils.generate_surrogate_key(['line_item_code']) }}::VARCHAR AS id,
	line_item_code::VARCHAR AS line_item_code,
	order_code::VARCHAR AS order_code,
	STRPTIME(date, '%m-%d-%y')::DATE AS date,
	status::VARCHAR AS status,
	fulfillment::VARCHAR AS fulfillment,
	sales_channel::VARCHAR AS sales_channel,
	ship_service_level::VARCHAR AS ship_service_level,
	style::VARCHAR AS style,
	sku::VARCHAR AS sku,
	category::VARCHAR AS category,
	size::VARCHAR AS size,
	asin::VARCHAR AS asin,
	courier_status::VARCHAR AS courier_status,
	quantity::BIGINT AS quantity,
	currency::VARCHAR AS currency,
	amount::DECIMAL(19, 4) AS amount,
	ship_city::VARCHAR AS ship_city,
	ship_state::VARCHAR AS ship_state,
	ship_postal_code::VARCHAR AS ship_postal_code,
	ship_country::VARCHAR AS ship_country,
	promotion_ids::VARCHAR AS promotion_ids,
	b2b::BOOLEAN AS b2b,
	fulfilled_by::VARCHAR AS fulfilled_by,
	unnamed_22::BOOLEAN AS unnamed_22
FROM
	cte_staging_amazon_sales_line_items

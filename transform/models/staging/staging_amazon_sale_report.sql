WITH cte_raw AS (

	SELECT * FROM {{ ref('raw_amazon_sale_report') }}

)

SELECT
	{{ dbt_utils.generate_surrogate_key(["index"]) }}::VARCHAR AS id,
	"index"::VARCHAR AS line_item_code,
	"Order ID"::VARCHAR AS order_code,
	"Date"::VARCHAR AS date,
	"Status"::VARCHAR AS status,
	"Fulfilment"::VARCHAR AS fulfillment,
	"Sales Channel "::VARCHAR AS sales_channel,
	"ship-service-level"::VARCHAR AS ship_service_level,
	"Style"::VARCHAR AS style,
	"SKU"::VARCHAR AS sku,
	"Category"::VARCHAR AS category,
	"Size"::VARCHAR AS size,
	"ASIN"::VARCHAR AS asin,
	"Courier Status"::VARCHAR AS courier_status,
	"Qty"::VARCHAR AS quantity,
	"currency"::VARCHAR AS currency,
	"Amount"::VARCHAR AS amount,
	"ship-city"::VARCHAR AS ship_city,
	"ship-state"::VARCHAR AS ship_state,
	"ship-postal-code"::VARCHAR AS ship_postal_code,
	"ship-country"::VARCHAR AS ship_country,
	"promotion-ids"::VARCHAR AS promotion_ids,
	"B2B"::VARCHAR AS b2b,
	"fulfilled-by"::VARCHAR AS fulfilled_by,
	"Unnamed: 22"::VARCHAR AS unnamed_22
FROM
	cte_raw

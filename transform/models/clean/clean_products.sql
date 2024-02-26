WITH cte_raw AS (

	SELECT * FROM {{ ref('raw_products') }}

)

SELECT
	{{ dbt_utils.generate_surrogate_key(["ID"]) }}::VARCHAR AS id,
	"ID"::VARCHAR AS product_code,
	"Name"::VARCHAR AS product_name,
	"Style"::VARCHAR AS style,
	"Category"::VARCHAR AS category,
	"Manufacturer"::VARCHAR AS manufacturer,
	"Supplier"::VARCHAR AS supplier
FROM
	cte_raw

WITH cte_raw AS (

	SELECT * FROM {{ ref('raw_stores') }}

)

SELECT
	{{ dbt_utils.generate_surrogate_key(["ID"]) }}::VARCHAR AS id,
	"ID"::VARCHAR AS store_code,
	"Name"::VARCHAR AS store_name,
	"City"::VARCHAR AS city,
	"Address"::VARCHAR AS store_address,
	"Phone"::VARCHAR AS phone_number
FROM
	cte_raw

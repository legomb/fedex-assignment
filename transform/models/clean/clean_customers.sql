WITH cte_raw AS (

	SELECT * FROM {{ ref('raw_customers') }}

)

SELECT
	{{ dbt_utils.generate_surrogate_key(["ID"]) }}::VARCHAR AS id,
	"ID"::VARCHAR AS customer_code,
	"Name"::VARCHAR AS customer_name,
	"City"::VARCHAR AS city,
	"Email"::VARCHAR AS email,
	"Phone"::VARCHAR AS phone_number
FROM
	cte_raw

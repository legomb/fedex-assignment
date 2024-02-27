WITH cte_clean_stores AS (

	SELECT * FROM {{ ref('clean_stores') }}

)

SELECT
	{{ dbt_utils.generate_surrogate_key(['store_code']) }} AS id,
	store_code,
	store_name,
	city,
	store_address,
	phone_number
FROM
	cte_clean_stores

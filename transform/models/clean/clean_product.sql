WITH cte_raw AS (

	SELECT * FROM {{ ref('raw_products') }}

)

SELECT *
FROM
	cte_raw

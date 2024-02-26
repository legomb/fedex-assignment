WITH cte_raw AS (

	SELECT * FROM {{ ref('clean_products') }}

)

SELECT *
FROM
	cte_raw

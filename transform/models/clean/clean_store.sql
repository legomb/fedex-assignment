WITH cte_raw AS (

	SELECT * FROM {{ ref('raw_stores') }}

)

SELECT *
FROM
	cte_raw

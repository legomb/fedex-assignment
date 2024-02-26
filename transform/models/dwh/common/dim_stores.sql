WITH cte_raw AS (

	SELECT * FROM {{ ref('clean_stores') }}

)

SELECT *
FROM
	cte_raw

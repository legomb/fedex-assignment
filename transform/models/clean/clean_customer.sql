WITH cte_raw AS (

	SELECT * FROM {{ ref('raw_customers') }}

)

SELECT *
FROM
	cte_raw

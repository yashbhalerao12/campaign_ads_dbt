SELECT 
lead_id,
COUNT(*) AS record_count
FROM {{ref('int_lead_funnel')}}
GROUP BY lead_id
HAVING COUNT(*) > 1
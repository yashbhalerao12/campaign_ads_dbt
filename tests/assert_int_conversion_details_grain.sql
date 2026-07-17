SELECT 
    conversion_id,
    COUNT(*) as record_count
FROM {{ref('int_conversion_details')}}
GROUP BY conversion_id
HAVING COUNT(*) > 1

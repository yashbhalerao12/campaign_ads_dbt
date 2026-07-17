SELECT
    date,
    ad_id,
    country,
    device,
    COUNT(*) AS record_count

FROM {{ref('stg_ad_performance')}}
GROUP BY 
    date,
    ad_id,
    country,
    device 
HAVING COUNT(*) > 1
SELECT
    ad_id,
    COUNT(*) as record_count
FROM {{ref('int_ad_hierarchy')}}
GROUP BY ad_id
HAVING COUNT(*) > 1
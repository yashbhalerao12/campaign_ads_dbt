SELECT
    date,
    ad_id,
    country,
    device,
    COUNT(*)
FROM {{ ref('fct_ads_performance') }}
GROUP BY
    date,
    ad_id,
    country,
    device
HAVING COUNT(*) > 1
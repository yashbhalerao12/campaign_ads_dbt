SELECT *
FROM {{ ref('stg_ad_performance') }}
WHERE impressions = 0
  AND clicks > 0
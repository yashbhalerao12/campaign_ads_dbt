SELECT *
FROM {{ ref('stg_ad_performance') }}
WHERE conversions > clicks
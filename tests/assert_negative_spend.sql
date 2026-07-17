{{ config(severity = 'warn') }}

SELECT *
FROM {{ref('stg_ad_performance')}}
WHERE spend < 0
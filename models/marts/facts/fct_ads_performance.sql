{{ config(
    materialized='incremental',
    incremental_strategy='merge',
    unique_key=[
        'date',
        'ad_id',
        'country',
        'device'
    ]
) }}

SELECT

date,
account_id,
campaign_id,
ad_group_id,
ad_id,
country,
device,
impressions,
clicks,
spend,
conversions,
conversion_value,
source_updated_at

FROM {{ref('stg_ad_performance')}} AS src

{% if is_incremental() %}


    WHERE src.source_updated_at >
(
    SELECT COALESCE(
        MAX(tgt.source_updated_at),
        '1900-01-01'
    )
    FROM {{ ref('stg_ad_performance') }} AS tgt
)


{% endif %}
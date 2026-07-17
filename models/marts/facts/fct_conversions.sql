{{ config(
    materialized='incremental',
    incremental_strategy='merge',
    unique_key='conversion_id'
) }}

SELECT

    -- Keys
    conversion_id,
    lead_id,
    customer_id,

    account_id,
    campaign_id,
    ad_group_id,
    ad_id,

    -- Event
    conversion_date,
    updated_at,
    conversion_type,
    is_refunded,

    -- Metric
    revenue

FROM {{ ref('int_conversion_details') }} AS src

{% if is_incremental() %}

WHERE src.updated_at >= (
    SELECT COALESCE(
        DATEADD(day, -1, MAX(t.updated_at)),
        TO_TIMESTAMP_NTZ('1900-01-01')
    )
    FROM {{ this }} AS t
)

{% endif %}
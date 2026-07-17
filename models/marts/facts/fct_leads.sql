{{ config(
    materialized='incremental',
    incremental_strategy='merge',
    unique_key='lead_id'
) }}

SELECT

-- Keys
lead_id,
customer_id,
account_id,
campaign_id,
ad_group_id,
ad_id,

-- Event
lead_created_at,
lead_status,
updated_at,
vehicle_type,
vehicle_category,

-- Metric
lead_value

FROM {{ ref('int_lead_funnel') }}

{% if is_incremental() %}

WHERE lead_created_at >= (
    SELECT DATEADD(day, -1, MAX(lead_created_at))
    FROM {{this}}
)
{% endif %}
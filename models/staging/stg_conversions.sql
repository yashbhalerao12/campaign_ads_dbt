WITH source AS (
    SELECT * FROM {{source('campaign_ads','conversions')}}
),
renamed AS (
    SELECT
        conversion_id::varchar as conversion_id,
        lead_id::varchar as lead_id,
        conversion_date::date as conversion_date,
        lower(conversion_type) as conversion_type,
        revenue,
        is_refunded,
        updated_at::timestamp as updated_at
    FROM source
)

SELECT * FROM renamed
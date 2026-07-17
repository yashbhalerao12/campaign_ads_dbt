WITH source AS(
    SELECT
    *
    FROM {{source('campaign_ads','leads')}}
),

renamed AS (
    SELECT
        lead_id::varchar as lead_id,
        created_at::timestamp as created_at,
        campaign_id::varchar as campaign_id,
        ad_id::varchar as ad_id,
        customer_id::varchar as customer_id,
        lower(lead_source) as lead_source,
        lower(lead_status) as lead_status,
        lower(vehicle_type) as vehicle_type,
        lower(vehicle_category) as vehicle_category,
        dealer_id::varchar as dealer_id,
        lead_value::varchar as lead_value
    FROM source
)

SELECT * FROM renamed
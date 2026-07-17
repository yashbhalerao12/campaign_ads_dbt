WITH source AS (
    SELECT * FROM {{source('campaign_ads','ad_groups')}}
),

renamed AS (
    SELECT 
        ad_group_id::varchar as ad_group_id,
        campaign_id::varchar as campaign_id,
        ad_group_name,
        lower(status) as status,
        lower(bid_strategy) as bid_strategy,
        lower(target_audience) as target_audience,
        created_at::timestamp as created_at,
        updated_at::timestamp as updated_at

    FROM source
)

SELECT * FROM renamed
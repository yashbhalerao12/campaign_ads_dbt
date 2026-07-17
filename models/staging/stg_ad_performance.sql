WITH source AS(
    SELECT * FROM {{source('campaign_ads','ad_performance')}}
),

deduplication AS (
    SELECT 
        date,
        platform,
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
        source_updated_at,
        ROW_NUMBER() OVER(PARTITION BY date,ad_id,country, device
         ORDER BY source_updated_at DESC) AS row_num
    FROM source
),


renamed AS (
    SELECT 
        date:: date as date,
        lower(platform) as platform ,
        account_id::varchar as account_id,
        campaign_id::varchar as campaign_id,
        ad_group_id::varchar as ad_group_id,
        ad_id::varchar as ad_id,
        upper(country) as country,
        lower(device) as device,
        impressions,
        clicks,
        spend,
        conversions,
        conversion_value,
        source_updated_at::timestamp as source_updated_at
        

    FROM deduplication
    WHERE row_num = 1
)

SELECT * FROM renamed
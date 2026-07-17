WITH source AS(
    SELECT * FROM {{source('campaign_ads','ads')}}
),

renamed AS(
    SELECT 
        ad_id::varchar as ad_id,
        ad_group_id::varchar as ad_group_id,
        ad_name,
        lower(ad_type) as ad_type,
        lower(status) as status,
        landing_page_url,
        created_at::timestamp as created_at,
        updated_at::timestamp as updated_at

    FROM source
)

SELECT * FROM renamed
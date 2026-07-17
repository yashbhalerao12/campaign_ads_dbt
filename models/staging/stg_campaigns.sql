WITH source AS (
    SELECT * FROM {{source('campaign_ads','campaigns')}}
),

renamed AS (
    SELECT 
     campaign_id::VARCHAR AS campaign_id,
     account_id::VARCHAR AS account_id,
     campaign_name,
     LOWER(objective) AS objective,
     LOWER(status) AS status,
     start_date::date AS start_date,
     end_date::date AS end_date,
     daily_budget,
     created_at::timestamp AS created_at,
     updated_at::timestamp AS updated_at
    FROM source
)

SELECT * FROM renamed

WITH source AS (
    SELECT * FROM {{ source('campaign_ads', 'ad_accounts') }}
),

renamed AS (SELECT 
    account_id::varchar AS account_id,
    account_name,
    {{clean_text('platform')}} AS platform,
    
    UPPER(currency) AS currency,
    timezone,
    created_at::timestamp AS created_at,
    updated_at::timestamp AS updated_at
FROM source)

SELECT * FROM renamed
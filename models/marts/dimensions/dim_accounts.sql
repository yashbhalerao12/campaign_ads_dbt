SELECT 
    account_id,
    account_name,
    platform,
    currency,
    timezone,
    created_at,
    updated_at
FROM {{ref('stg_ad_accounts')}}
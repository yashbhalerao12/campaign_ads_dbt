{{config(
    tags=["dimensions","marketing"]
)}}

SELECT 
    {{ dbt_utils.generate_surrogate_key([
        'c.campaign_id'
    ])}} AS campaign_sk,
    c.campaign_id,
    c.campaign_name,
    c.objective,
    c.status as campaign_status,
    c.daily_budget,
    c.start_date,
    c.end_date,
    a.account_id,
    a.account_name,
    a.platform,
    a.currency,
    a.timezone
FROM {{ref('stg_campaigns')}} c
LEFT JOIN {{ref('stg_ad_accounts')}} a
ON c.account_id = a.account_id
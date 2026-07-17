SELECT
ag.ad_group_id,
ag.ad_group_name,
ag.status,
ag.bid_strategy,
ag.target_audience,
ag.created_at as ad_group_created_at,
ag.updated_at as ad_group_updated_at,
dc.campaign_name,
dc.objective,
dc.account_name,
dc.platform
FROM {{ref('stg_ad_groups')}} ag
LEFT JOIN {{ref('dim_campaigns')}} dc
ON ag.campaign_id = dc.campaign_id 
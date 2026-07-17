SELECT 
-- lead table
l.lead_id,
l.customer_id,
l.lead_status,
l.lead_value,
l.vehicle_type,
l.vehicle_category,
l.created_at as lead_created_at,
-- ad
h.ad_id,
h.ad_name,
h.ad_type,
h.ad_status,

-- ad_group
h.ad_group_id,
h.ad_group_name,
h.ad_group_status,
h.bid_strategy,
h.target_audience,
-- camapign
h.campaign_id,
h.campaign_name,
h.objective,
h.campaign_status,
h.daily_budget,
-- ad_accounts
h.account_id,
h.account_name,
h.platform,
h.currency,
h.timezone

FROM {{ref('stg_leads')}} l
LEFT JOIN {{ref('int_ad_hierarchy')}} h 
ON l.ad_id = h.ad_id

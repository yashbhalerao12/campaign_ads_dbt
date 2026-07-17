SELECT 

-- Ad
a.ad_id,
a.ad_name,
a.ad_type,
a.status as ad_status,
a.landing_page_url,
a.created_at as ad_created_at,

-- Ad Group
g.ad_group_id,
g.ad_group_name,
g.status as ad_group_status,
g.bid_strategy,
g.target_audience,

-- Campaigns
c.campaign_id,
c.campaign_name,
c.objective,
c.status as campaign_status,
c.daily_budget,
c.start_date,
c.end_date,

-- Ad Accounts
ac.account_id,
ac.account_name,
ac.platform,
ac.currency,
ac.timezone


FROM {{ref('stg_ads')}} a 
LEFT JOIN {{ref('stg_ad_groups')}} g 
ON a.ad_group_id = g.ad_group_id
LEFT JOIN {{ref('stg_campaigns')}} c 
ON c.campaign_id = g.campaign_id
LEFT JOIN {{ref('stg_ad_accounts')}} ac 
ON c.account_id = ac.account_id
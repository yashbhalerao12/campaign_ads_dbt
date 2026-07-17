SELECT
    -- conversions
    c.conversion_id,
    c.conversion_date,
    c.conversion_type,
    c.revenue,
    c.is_refunded,
    c.updated_at,
    -- leads
    l.lead_id,
    l.customer_id,
    l.lead_status,
    l.lead_value,
    l.vehicle_type,
    l.vehicle_category,
    l.lead_created_at,
    -- ad
    l.ad_id,
    l.ad_name,
    -- group
    l.ad_group_id,
    l.ad_group_name,
    -- campaign
    l.campaign_id,
    l.campaign_name,
    l.objective,
    -- ad_accounts
    l.account_id,
    l.account_name,
    l.platform,
    l.currency,
    l.timezone
FROM {{ref('stg_conversions')}} c 
LEFT JOIN {{ref('int_lead_funnel')}} l 
ON c.lead_id = l.lead_id
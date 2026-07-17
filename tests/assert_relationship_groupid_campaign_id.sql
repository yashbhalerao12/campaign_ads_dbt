SELECT
    l.lead_id,
    l.campaign_id AS lead_campaign_id,
    l.ad_id,
    ag.campaign_id AS ad_campaign_id

FROM {{ ref('stg_leads') }} l

LEFT JOIN {{ ref('stg_ads') }} a
    ON l.ad_id = a.ad_id

LEFT JOIN {{ ref('stg_ad_groups') }} ag
    ON a.ad_group_id = ag.ad_group_id

WHERE l.campaign_id != ag.campaign_id
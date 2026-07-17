{{ config(
materialized='table'
) }}

WITH performance AS (
    SELECT
        date,
        campaign_id,
        account_id,
        device,
        country,
        SUM(impressions) AS impressions,
        SUM(clicks) AS clicks,
        SUM(spend) AS spend,
        SUM(conversions) AS conversions,
        SUM(conversion_value) AS conversion_value

    FROM {{ref('fct_ads_performance')}}

    GROUP BY 

        date,
        campaign_id,
        account_id,
        device,
        country
),

revenue AS (
    SELECT

        campaign_id,
        SUM(revenue) AS revenue

    FROM {{ref('fct_conversions')}}

    GROUP BY  campaign_id
)

SELECT

    p.date,
    a.account_name,
    a.platform,
    c.campaign_name,
    p.country,
    p.impressions,
    p.clicks,
    p.spend,
    p.conversions,

COALESCE(r.revenue,0) AS revenue,

ROUND(p.clicks*100.0/NULLIF(p.impressions,0),2) AS ctr,

ROUND(p.spend/NULLIF(p.clicks,0),2) AS cpc,

ROUND(p.spend*1000/NULLIF(p.impressions,0),2) AS cpm,

ROUND(COALESCE(r.revenue,0)/NULLIF(p.spend,0),2) AS roas

FROM performance p

LEFT JOIN {{ ref('dim_campaigns') }} c

ON p.campaign_id=c.campaign_id

LEFT JOIN {{ ref('dim_accounts') }} a

ON p.account_id=a.account_id

LEFT JOIN revenue r

ON p.campaign_id=r.campaign_id
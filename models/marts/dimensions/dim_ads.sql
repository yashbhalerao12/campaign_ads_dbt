{{config(
    tags=["dimensions","advertisment"],
    post_hook="{{ log_model_run() }}"
)}}

SELECT
    ad_id,
    ad_name,
    ad_type,
    ad_status,

    ad_group_id,
    ad_group_name,

    campaign_id,
    campaign_name,
    objective,
    campaign_status,

    account_id,
    account_name,
    platform,
    currency,
    timezone
FROM {{ ref('int_ad_hierarchy') }}
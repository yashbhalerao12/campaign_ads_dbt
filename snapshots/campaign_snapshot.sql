{% snapshot campaigns_snapshot %}

{{

    config(
        target_schema='SNAPSHOTS',
        unique_key='campaign_id',
        strategy='timestamp',
        updated_at='updated_at'
    )

}}


SELECT * FROM {{ref('stg_campaigns')}}

{% endsnapshot %}
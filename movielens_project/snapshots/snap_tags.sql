{% snapshot snap_tags %}

{{
    config(
        target_schema='snapshots',
        unique_key=['userid', 'movieid', 'tag'],
        strategy= 'timestamp',
        updated_at = 'tag_timestamp',
        invalidate_hard_deletes= true
    )

}}

SELECT
    {{ dbt_utils.generate_surrogate_key(['userid', 'movieid', 'tag']) }} AS row_key,
    userid,
    movieid,
    tag,
    CAST(tag_timestamp AS TIMESTAMP) AS tag_timestamp
FROM {{ ref('src_tags') }}
LIMIT 100

{% endsnapshot %}
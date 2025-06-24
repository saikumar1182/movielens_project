{{
    config(
        materialized = 'incremental',
        on_schema_change = 'fail'
    )
}}

WITH src_ratings AS (
    SELECT * FROM {{ ref('src_ratings') }}
)

SELECT
    userid,
    movieid,
    rating,
    rating_timestamp
FROM src_ratings
WHERE rating IS NOT NULL

{% if is_incremental() %}
    AND rating_timestamp > (SELECT MAX(rating_timestamp) FROM {{ this }})
{% endif %}
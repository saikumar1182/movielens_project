WITH ratings AS (
    SELECT DISTINCT userid FROM {{ ref('src_ratings') }}
),
tags AS (
    SELECT DISTINCT userid FROM {{ ref('src_tags') }}
)
SELECT DISTINCT userid
FROM (
    SELECT * FROM ratings
    UNION DISTINCT
    SELECT * FROM tags
)

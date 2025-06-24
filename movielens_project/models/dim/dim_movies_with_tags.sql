{{
    config(
        materialized= 'ephemeral'
    )
}}
WITH movies AS (
    SELECT * FROM {{ ref('dim_movies') }}
),
tags AS (
    SELECT * FROM {{ ref('dim_genome_tags') }}
),
scores AS (
    SELECT * FROM {{ ref('fct_genome_scores') }}
)

SELECT
    m.movieid,
    m.movie_title,
    m.genres,
    t.tag,
    s.relevance_score
FROM movies m
LEFT JOIN scores s ON m.movieid = s.movieid
LEFT JOIN tags t ON t.tagid = s.tagid
WITH src_scores AS (
    SELECT * FROM {{ ref('src_genome_scores') }}

)
SELECT 
    movieid,
    tagid,
    ROUND(relevance, 4) AS relevance_score
FROM src_scores
WHERE relevance > 0
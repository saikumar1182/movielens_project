WITH raw_genome_scores AS (
    SELECT * FROM {{ source('movielens_project','raw_genome_scores') }}
)
SELECT
    movieId AS movieid,
    tagId AS tagid,
    relevance
FROM raw_genome_scores

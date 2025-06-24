WITH raw_genome_tags AS (
    SELECT * FROM {{ source('movielens_project','raw_genome_tags') }}
)
SELECT
    tagId AS tagid,
    tag
FROM raw_genome_tags

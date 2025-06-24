WITH raw_tags AS (
    SELECT * FROM {{ source('movielens_project', 'raw_tags')}}
)
SELECT
    userId AS userid,
    movieId AS movieid,
    tag,
    TIMESTAMP_SECONDS(timestamp) AS tag_timestamp
FROM raw_tags

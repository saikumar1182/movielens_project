WITH raw_ratings AS (
    SELECT * FROM {{ source('movielens_project', 'raw_ratings')}}
)
SELECT
    userId AS userid,
    movieId AS movieid,
    rating,
    TIMESTAMP_SECONDS(timestamp) AS rating_timestamp
FROM raw_ratings


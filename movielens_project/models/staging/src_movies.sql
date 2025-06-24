WITH raw_movies  AS (
    SELECT * FROM {{ source('movielens_project', 'raw_movies')}}
)
SELECT
    movieId AS movieid,
    title,
    genres
FROM raw_movies

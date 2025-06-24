WITH raw_links AS (
    SELECT * FROM {{ source('movielens_project','raw_links') }}
)
SELECT
    movieId AS movieid,
    imdbId AS imbdid,
    tmdbId AS tmdbid
FROM raw_links


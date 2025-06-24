WITH summary AS (
    SELECT
        movieid,
        AVG(rating) AS average_ratings,
        COUNT(*) AS total_rating_count
    FROM {{ ref('fct_ratings') }}
    GROUP BY movieid
    HAVING COUNT(*) > 50    -- only movies with ratings at least 50
)

SELECT
    m.movie_title,
    s.average_ratings,
    s.total_rating_count
FROM summary s
JOIN {{ ref('dim_movies')}} m ON m.movieid = s.movieid
ORDER BY s.average_ratings DESC
LIMIT 50
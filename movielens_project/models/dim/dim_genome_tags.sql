WITH src_tags AS (
    SELECT * FROM {{ ref('src_genome_tags') }}

)
SELECT 
    tagid,
    INITCAP(TRIM(tag)) AS tag_name
FROM src_tags
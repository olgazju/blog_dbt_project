{{
    config(
            table_type = "fact",
            primary_index = ["app"]
    )
}}

with logs as (

    select * from {{ ref('stg_logs') }}

),

countries_regions AS (
    SELECT
        *
    FROM
        {{ ref('countries_by_region') }}
)

SELECT country_region,
    app,
    year,
    count(ip_address) as ip_address_count
FROM logs 
LEFT JOIN countries_regions on country==country_code
where year >= '{{ var("start_year") }}'
group by 1,2,3

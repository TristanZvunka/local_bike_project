SELECT
    *
FROM
    {{ ref('int__order')}}
WHERE
    city = 'Santa Cruz Bikes'
WITH CTE AS
(
    SELECT      t.*,
                w.*
    FROM        {{ ref('trip_fact') }} AS t
    LEFT JOIN   {{ ref('daily_weather') }} AS w ON t.TRIP_DATE = w.daily_weather
)
SELECT      *
FROM        CTE

WITH daily_weather AS
(
    SELECT      DATE(TIME) AS daily_weather,
                WEATHER,
                TEMP,
                PRESSURE,
                HUMIDITY,
                CLOUDS
    FROM        {{ source('demo', 'weather') }}
),
daily_weather_agg AS
(
    SELECT      daily_weather,
                WEATHER,
                ROUND(AVG(TEMP),2) AS avg_temp,
                ROUND(AVG(PRESSURE),2) AS avg_pressure,
                ROUND(AVG(HUMIDITY),2) AS avg_humidity,
                ROUND(AVG(CLOUDS),2) AS avg_clouds
    FROM        daily_weather
    GROUP BY    daily_weather,
                WEATHER
    QUALIFY     ROW_NUMBER() OVER(PARTITION BY daily_weather ORDER BY COUNT(weather) DESC) = 1

)
SELECT      *
FROM        daily_weather_agg
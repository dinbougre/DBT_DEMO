WITH BIKE AS
(
    SELECT      DISTINCT 
                START_STATIO_ID AS START_STATION_ID,
                START_STATION_NAME,
                START_LAT,
                START_LNG
    FROM        {{ source('demo', 'bike') }}
    WHERE       RIDE_ID <> 'ride_id'

)
SELECT      *
FROM        BIKE
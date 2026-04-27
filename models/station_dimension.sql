WITH BIKE AS
(
    SELECT      DISTINCT 
                START_STATIO_ID AS START_STATION_ID,
                START_STATION_NAME,
                START_LAT,
                START_LNG
    FROM        {{ ref('stg_bike') }}
    WHERE       RIDE_ID <> 'ride_id'

)
SELECT      *
FROM        BIKE
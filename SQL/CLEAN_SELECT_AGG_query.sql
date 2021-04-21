WITH query2 AS (WITH query1 AS (SELECT 

DISTINCT(ride_id), 
rideable_type, 
TO_TIMESTAMP(started_at,'YYYY-MM-DD HH24:MI:SS') AS started_at, 
TO_TIMESTAMP(ended_at,'YYYY-MM-DD HH24:MI:SS') AS ended_at, 
start_station_name, 
start_station_id, 
end_station_name, 
end_station_id, 
CAST(start_lat as float), 
CAST(start_lng as float), 
CAST(end_lat as float), 
CAST(end_lng as float), 
member_casual

FROM table_cyclistic

WHERE started_at < ended_at AND
ride_id  IS NOT NULL AND
rideable_type  IS NOT NULL AND
started_at  IS NOT NULL AND
ended_at  IS NOT NULL AND
start_station_name  IS NOT NULL AND
start_station_id  IS NOT NULL AND
end_station_name  IS NOT NULL AND
end_station_id  IS NOT NULL AND
start_lat  IS NOT NULL AND
start_lng  IS NOT NULL AND
end_lat  IS NOT NULL AND
end_lat  IS NOT NULL AND
member_casual IS NOT NULL
)

SELECT 

rideable_type,
member_casual,
EXTRACT(EPOCH from AGE(ended_at,started_at))/60 AS ride_length_minutes,
CASE
	WHEN EXTRACT(DOW from ended_at) = 0 THEN 'sunday'
	WHEN EXTRACT(DOW from ended_at) = 1 THEN 'monday'
	WHEN EXTRACT(DOW from ended_at) = 2 THEN 'thuesday'
	WHEN EXTRACT(DOW from ended_at) = 3 THEN 'wednesday'
	WHEN EXTRACT(DOW from ended_at) = 4 THEN 'thursday'
	WHEN EXTRACT(DOW from ended_at) = 5 THEN 'friday'
	ELSE 'saturday'
END AS day_of_week,
EXTRACT(YEAR from ended_at) AS year,
EXTRACT(MONTH from ended_at) AS month

FROM query1
WHERE EXTRACT(EPOCH from AGE(ended_at,started_at))/60 > 1)

SELECT 

year,
month,
day_of_week,
member_casual,
rideable_type,

count(*) AS count_usage,
sum(ride_length_minutes) AS total_length FROM query2

GROUP BY 
year,
month,
day_of_week,
member_casual,
rideable_type



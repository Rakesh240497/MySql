-- SELECT count(*) FROM `bigquery-public-data.new_york_taxi_trips.tlc_green_trips_2014` LIMIT 1000


-- select  trip_type, avg(trip_distance) over(partition by passenger_count order by passenger_count asc) as passenger_per_distance from `bigquery-public-data.new_york_taxi_trips.tlc_green_trips_2014` 

-- select pickup_datetime from `bigquery-public-data.new_york_taxi_trips.tlc_green_trips_2015` 
-- order by pickup_datetime limit 1

-- select distinct pickup_datetime from (select pickup_datetime, RANK() over(partition by data_file_month order by pickup_datetime asc) as rank_1 from `bigquery-public-data.new_york_taxi_trips.tlc_green_trips_2014` ) where rank_1 = 1

-- select distinct data_file_month from `bigquery-public-data.new_york_taxi_trips.tlc_green_trips_2014`

-- select distinct pickup_location_id, dropoff_location_id from `bigquery-public-data.new_york_taxi_trips.tlc_green_trips_2014`

-- select trip_type, trip_distance from `bigquery-public-data.new_york_taxi_trips.tlc_green_trips_2014` where fare_amount = total_amount;


-- select data_file_month, sum(case when cast(vendor_id as INT64) = 1 then 1 else 1 end) as trips, avg(trip_distance) trip_distance from `bigquery-public-data.new_york_taxi_trips.tlc_green_trips_2014`
-- group by data_file_month
-- order by data_file_month asc



-- select sum(fare_amount) as total_revenue, trip_type from `bigquery-public-data.new_york_taxi_trips.tlc_green_trips_2014`
-- group by trip_type

-- JOINS 

-- select sum(case when cast(ft.vendor_id as INT64) = 1 then 1 else 1 end) as total2015, sum(case when cast(ftt.vendor_id as INT64) = 1 then 1 else 1 end) as total2014 from `bigquery-public-data.new_york_taxi_trips.tlc_green_trips_2014` ft inner join `bigquery-public-data.new_york_taxi_trips.tlc_green_trips_2015` ftt on ftt.pickup_location_id = ft.pickup_location_id and ftt.dropoff_location_id = ft.dropoff_location_id
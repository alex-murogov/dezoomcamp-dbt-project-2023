{{ config(materialized="view") }}

select *--, row_number() over (partition by vendorid, lpep_pickup_datetime) as rn
from {{ source("staging", "green_tripdata") }}
where vendorid is not null
limit 10 


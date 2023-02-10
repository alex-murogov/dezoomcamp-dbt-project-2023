{{ config(materialized='view') }}


  select *
    --row_number() over(partition by vendorid, tpep_pickup_datetime) as rn
  from {{ source('staging','yellow_tripdata') }}
  where vendorid is not null 
  limit 10 
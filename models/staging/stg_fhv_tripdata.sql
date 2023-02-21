select
    dispatching_base_num,
    pickup_datetime,
    dropoff_datetime,
    pulocationid as pickup_locationid,
    dolocationid as dropoff_locationid,
    sr_flag,
    affiliated_base_number
from {{ source("staging", "fhv_2019") }}

{% if var("is_test_run", default=true) %} limit 100 {% endif %}


-- dbt build --m stg_fhv_tripdata.sql --var 'is_test_run: false'
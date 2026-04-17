{{
    config(
        materialized='table'
    )
}}

select *
from raw.customers
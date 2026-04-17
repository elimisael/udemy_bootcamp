{{
    config(
        materialized='table'
    )
}}

select *
from raw.product
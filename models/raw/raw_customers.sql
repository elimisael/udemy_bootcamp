{{
    config(
        materialized='table'
    )
}}

select *
from {{ source('GlobalMarket', 'customers') }}
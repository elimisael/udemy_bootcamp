{{
    config(
        materialized='table'
    )
}}

select *
from udemy_bootcamp.raw.orders
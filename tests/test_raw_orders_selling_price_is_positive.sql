with orders as (
    select *
    from {{ ref('raw_orders') }}
)
select 
    OrderID,
    sum(OrderSellingPrice) as Total_sp
from orders
group by OrderID
having Total_sp < 0
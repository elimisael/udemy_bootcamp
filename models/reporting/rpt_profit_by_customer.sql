select
    so.CustomerID,
    so.Segment,
    so.Country,
    sum(so.OrderProfit) as Profit
from {{ ref('stg_orders') }} as so
group by
    so.CustomerID,
    so.Segment,
    so.Country
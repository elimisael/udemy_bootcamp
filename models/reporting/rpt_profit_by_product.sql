select 
    so.ProductID,
    so.ProductName,
    so.Category,
    so.SubCategory,
    sum(so.OrderProfit) as Profit
from {{ ref('stg_orders') }} as so
group by
    so.ProductID,
    so.ProductName,
    so.Category,
    so.SubCategory
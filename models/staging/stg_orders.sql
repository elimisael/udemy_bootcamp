select 
    -- from orders
    {{ dbt_utils.generate_surrogate_key(['o.OrderID', 'c.CustomerID', 'p.ProductID']) }} as sk_orders,
    o.OrderID,
    o.OrderDate,
    o.ShipDate,
    o.ShipMode,
    o.OrderSellingPrice - o.OrderCostPrice as OrderProfit,
    o.OrderCostPrice,
    o.OrderSellingPrice,
    -- from customer
    c.CustomerID,
    c.CustomerName,
    c.Segment,
    c.Country,
    -- from product
    p.ProductID,
    p.Category,
    p.ProductName,
    p.SubCategory,
    {{ markup('o.OrderSellingPrice', 'o.OrderCostPrice') }} as MarkUp,
    dt.delivery_team
from {{ ref('raw_orders') }} as o
    left join {{ ref('raw_customers') }} as c
        on o.CustomerID = c.CustomerID
    left join {{ ref('raw_products') }} as p
        on o.ProductID = p.ProductID
    left join {{ ref('delivery_team') }} as dt 
       on o.ShipMode = dt.ShipMode
{{ limit_data_in_dev('OrderDate')}}
-- from raw.orders
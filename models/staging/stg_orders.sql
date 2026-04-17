select 
    -- from orders
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
    p.SubCategory
from {{ ref('raw_orders') }} as o
    left join {{ ref('raw_customers') }} as c
        on o.CustomerID = c.CustomerID
    left join {{ ref('raw_products') }} as p
        on o.ProductID = p.ProductID
-- from raw.orders
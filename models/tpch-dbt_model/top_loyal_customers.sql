select
    customer.custkey,
    customer.name as customer_name,
    count(orders.orderkey) as total_orders,
    sum(orders.totalprice) as total_spent
from snowflake_sample_data.tpch_sf1.customer c
join snowflake_sample_data.tpch_sf1.orders o
    on customer.custkey = orders.custkey
group by
    customer.custkey,
    customer.name
order by
    total_orders desc,
    total_spent desc
limit 10;

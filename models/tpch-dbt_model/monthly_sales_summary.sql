select
    r.r_name as region,
    date_trunc('month', o.o_orderdate) as order_month,
    sum(o.o_totalprice) as total_sales,
    count(distinct o.o_orderkey) as num_orders
from {{ source('tpch_dbt', 'orders') }} o
join {{ source('tpch_dbt', 'customer') }} c
    on c.c_custkey = o.o_custkey
join {{ source('tpch_dbt', 'nation') }} n
    on c.c_nationkey = n.n_nationkey
join {{ source('tpch_dbt', 'region') }} r
    on n.n_regionkey = r.r_regionkey
group by
    r.r_name,
    date_trunc('month', o.o_orderdate)
order by
    order_month,
    region

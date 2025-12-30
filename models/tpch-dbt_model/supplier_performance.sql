select
    s.s_suppkey,
    s.s_name,
    sum(l.l_extendedprice * (1 - l.l_discount)) as total_sales,
    avg(l.l_discount) as avg_discount,
    count(distinct l.l_orderkey) as num_orders
from {{ source('tpch_dbt', 'lineitem') }} l
join {{ source('tpch_dbt', 'supplier') }} s
    on l.l_suppkey = s.s_suppkey
group by s.s_suppkey, s.s_name
order by total_sales desc

select
    r.r_name as region,
    p.p_type as product_type,
    sum(l.l_extendedprice * (1 - l.l_discount)) as revenue
from {{ source('tpch_dbt', 'lineitem') }} l
join {{ source('tpch_dbt', 'orders') }} o
    on l.l_orderkey = o.o_orderkey
join {{ source('tpch_dbt', 'part') }} p
    on l.l_partkey = p.p_partkey
join {{ source('tpch_dbt', 'customer') }} c
    on o.o_custkey = c.c_custkey
join {{ source('tpch_dbt', 'nation') }} n
    on c.c_nationkey = n.n_nationkey
join {{ source('tpch_dbt', 'region') }} r
    on n.n_regionkey = r.r_regionkey
group by r.r_name, p.p_type
order by region, revenue desc

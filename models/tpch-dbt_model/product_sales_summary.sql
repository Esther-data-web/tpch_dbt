select
    p.p_partkey,
    p.p_name,
    p.p_type,
    sum(l.l_extendedprice * (1 - l.l_discount)) as revenue,
    sum(l.l_quantity) as total_quantity
from {{ source('tpch_dbt', 'lineitem') }} l
join {{ source('tpch_dbt', 'part') }} p
    on l.l_partkey = p.p_partkey
group by
    p.p_partkey,
    p.p_name,
    p.p_type
order by
    revenue desc


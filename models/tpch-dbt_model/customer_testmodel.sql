select
    customer.c_custkey,
    customer.c_name as customer_name,
    count(orders.o_orderkey) as total_orders,
    sum(orders.o_totalprice) as total_spent
from MY_DBT_OUTPUTS.TPCH_SF1.CUSTOMER customer
join MY_DBT_OUTPUTS.TPCH_SF1.ORDERS orders
    on customer.c_custkey = orders.o_custkey
with cte_1 as (SELECT 
segment,
count(distinct p.product_code) as product_count_2020
FROM dim_product p 
join fact_sales_monthly s 
on s.product_code=p.product_code
where fiscal_year= 2020
group by segment	
order by product_count_2020 desc),
cte_2 as (
       SELECT 
      segment,
count(distinct p.product_code) as product_count_2021
FROM dim_product p 
join fact_sales_monthly s 
on s.product_code=p.product_code
where fiscal_year= 2021
group by segment
order by product_count_2021 desc
)
select cte_1.segment,cte_1.product_count_2020,cte_2.product_count_2021,
product_count_2021-product_count_2020 as difference
from cte_1
join cte_2
on cte_1.segment=cte_2.segment
order by difference desc
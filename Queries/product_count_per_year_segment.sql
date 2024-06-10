with X as (SELECT 
p.segment,s.fiscal_year,
count(distinct(p.product_code)) as product_count

FROM dim_product p
join fact_sales_monthly s
on s.product_code=p.product_code
group by p.segment,
	     s.fiscal_year)
select
ps_2020.segment,
ps_2020.product_count as product_count_2020,
ps_2021.product_count as product_count_2021,
ps_2021.product_count-ps_2020.product_count as difference
from X as ps_2020
join x as ps_2021
on ps_2020.segment=ps_2021.segment
AND ps_2020.fiscal_year = 2020 
    AND ps_2021.fiscal_year = 2021
    order by difference desc



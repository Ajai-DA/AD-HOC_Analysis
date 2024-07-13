with X as (SELECT 
count(distinct(product_code)) aS unique_pruducts_2020
from fact_sales_monthly
where fiscal_year="2020"),

 Y as 
(SELECT
count(distinct(product_code)) aS unique_pruducts_2021
from fact_sales_monthly
where fiscal_year="2021")

select *,
round(((unique_pruducts_2021-unique_pruducts_2020)*100/unique_pruducts_2020),2) as pct_change
from X
cross join Y;
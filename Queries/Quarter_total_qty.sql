SELECT 
CASE 
   WHEN month(s.date) IN (9,10,11) then "Q1"
    WHEN month(s.date) IN (12,1,2) then "Q2"
     WHEN month(s.date) IN (3,4,5) then "Q3"
     else "Q4"
     END as QUARTER,
     sum(s.sold_quantity) as total_qty
FROM fact_sales_monthly s 
join dim_customer c
on c.customer_code=s.customer_code
where fiscal_year=2020
group by quarter
order by quarter asc
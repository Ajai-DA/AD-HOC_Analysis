with X as (SELECT 
c.channel,
(sum(s.sold_quantity*g.gross_price)/100000) as gross_sales_mln

FROM fact_sales_monthly s
join fact_gross_price g on s.product_code=g.product_code
join dim_customer c on s.customer_code=c.customer_code
where s.fiscal_year=2021
GROUP BY c.channel)

SELECT *,
   round((gross_sales_mln*100)/
        (select sum(gross_sales_mln) from x),2)as pct_contributions		
FROM X



SELECT 
month(s.date) as months,year(s.date) as years,
round(sum(sold_quantity*gross_price),2) as gross_sales_amount
FROM  fact_sales_monthly s
 join fact_gross_price g on s.product_code=g.product_code
   join dim_customer c on c.customer_code=s.customer_code 
   group by years,months
    order by months, 
             years
   
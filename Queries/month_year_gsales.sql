SELECT 
monthname(s.date) as MONTH, s.fiscal_year,
round(sum(s.sold_quantity*g.gross_price),2) as gross_sales_amount
FROM fact_sales_monthly s
join dim_customer c 
on c.customer_code=s.customer_code
join fact_gross_price g 
on g.product_code=s.product_code and g.fiscal_year=s.fiscal_year
group by s.date,s.fiscal_year

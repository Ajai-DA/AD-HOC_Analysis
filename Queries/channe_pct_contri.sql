SELECT 
c.channel,
concat(cast(round(sum(s.sold_quantity*g.gross_price)/1000000,2) as char)," M") as gross_sales_mln,
round(sum(s.sold_quantity*g.gross_price)*100/sum(sum(s.sold_quantity*g.gross_price)) over(),2) as pct_contribution
FROM fact_sales_monthly s
join fact_gross_price g
on g.product_code=s.product_code and g.fiscal_year=s.fiscal_year
join dim_customer c
on c.customer_code=s.customer_code
where s.fiscal_year=2021
group by c.channel
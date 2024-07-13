SELECT 
  c.customer,c.customer_code,
  round(pre.pre_invoice_discount_pct*100,2) as pre_invoice_discount_pct
FROM dim_customer c
join fact_pre_invoice_deductions pre
on c.customer_code=pre.customer_code
where pre.fiscal_year=2021
and market = "india"
and pre_invoice_discount_pct > (SELECT avg(pre_invoice_discount_pct)
                                      FROM fact_pre_invoice_deductions) 
order by pre_invoice_discount_pct desc
limit 5                                      
                                      
                                      
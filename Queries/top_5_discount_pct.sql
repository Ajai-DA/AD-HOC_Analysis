SELECT 
pre.customer_code,c.customer,
pre.pre_invoice_discount_pct
 FROM fact_pre_invoice_deductions pre
 join dim_customer c
 on c.customer_code=pre.customer_code
 where market="india"
 and fiscal_year="2021"
 order by pre_invoice_discount_pct desc
 limit 5
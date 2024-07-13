SELECT
m.product_code,p.product,m.manufacturing_cost
 FROM fact_manufacturing_cost m
 join dim_product p
 on p.product_code=m.product_code
 where manufacturing_cost in(
							(select min(manufacturing_cost) from fact_manufacturing_cost ),
                            (select max(manufacturing_cost) from fact_manufacturing_cost)
                            );
WITH RankedSales AS (
  SELECT 
    p.division,
    s.product_code,
    sum(s.sold_quantity) as sold_quantity,
    ROW_NUMBER() OVER (PARTITION BY p.division ORDER BY sum(s.sold_quantity) DESC) as rn
  FROM fact_sales_monthly s
  JOIN dim_product p ON s.product_code = p.product_code
  WHERE s.fiscal_year = 2021
  GROUP BY p.division, s.product_code
)
SELECT 
  division,
  product_code,
  sold_quantity
FROM RankedSales
WHERE rn <= 3
ORDER BY division, rn;

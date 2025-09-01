use retail_pro_sales;

describe retail_sales;

select * from retail_sales;

select * from retail_sales
where unit_price is null;

select sum(CASE WHEN  product_id is null then 1 else 0 end) as missing_count,
       sum(CASE WHEN product_id is not null then 1 ELSE 0 END) as non_missing_count
from retail_sales;

SELECT 
    product_id,
    product_category_name,
    sum(unit_price) as unit_price,
    sum(total_price) as total_profit,
    round(sum(total_price) / nullif(sum(total_price),0) * 10, 2) as profit_margin_percent
FROM retail_sales
GROUP BY product_id, product_category_name
ORDER BY profit_margin_percent asc;

select volume from retail_sales
where volume> 10000;

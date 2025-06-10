-- 06_ctes.sql
-- a) Use a CTE to calculate each product’s total monthly quantity,
-- then select products with combined output > 500 in the last month.
WITH avg_daily AS (
  SELECT product_id,
    AVG(quantity)::numeric
      / NULLIF( MAX(run_date) - MIN(run_date), 0 ) 
      AS avg_per_day
    FROM production_runs
   GROUP BY product_id
),
latest_inv AS (
  SELECT product_id,
         qty_on_hand,
         last_updated
    FROM inventory
   WHERE last_updated = (
     SELECT MAX(last_updated)
       FROM inventory i2
      WHERE i2.product_id = inventory.product_id
   )
)
SELECT p.product_id,
       p.name           AS product_name,
       ld.qty_on_hand   AS latest_inventory,
       ad.avg_per_day   AS avg_daily_production
  FROM avg_daily ad
  JOIN latest_inv ld
    ON ad.product_id = ld.product_id
  JOIN products p
    ON ad.product_id = p.product_id
 ORDER BY ld.qty_on_hand / NULLIF(ad.avg_per_day,0) ASC;
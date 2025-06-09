-- 02_filter_runs_and_inventory.sql
-- a) Recent production runs
select run_id,
       product_id,
       run_date,
       quantity
  from production_runs
where run_date >= CURRENT_DATE - interval '30 days'
order BY run_date desc;

-- b) Low-stock inventory
select inv_id,
       product_id,
       location,
       qty_on_hand,
       last_updated
  FROM inventory
where qty_on_hand < 10;
-- 03_joins.sql
-- a) Products with supplier info
select p.product_id,
       p.name as product_name,
       s.name as supplier_name,
       p.unit_price
  from products p
  join suppliers s
  on p.supplier_id = s.supplier_id
 order by  s.name, p.name;

-- b) Runs with product details
select r.run_id,
       r.run_date,
       r.quantity,
       p.name as product_name,
       p.unit_price
   from production_runs r
   join products p
   on r.product_id = p.product_id
  order by r.run_date desc;
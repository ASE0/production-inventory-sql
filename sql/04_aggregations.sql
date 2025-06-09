-- 04_aggregations.sql
-- a) Total units produced per product
select p.product_id,
       p.name as product_name,
       SUM(r.quantity) as total_produced
    from products p
    join production_runs r
    on p.product_id = r.product_id
   group by p.product_id, p.name
   order by total_produced desc;

-- b) Average on-hand inventory per product
select i.product_id,
       p.name as product_name,
       AVG(i.qty_on_hand) as avg_inventory
     from inventory i
     join products p
     on i.product_id = p.product_id
    group by i.product_id, p.name
    order by avg_inventory asc;
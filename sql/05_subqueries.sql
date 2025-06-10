-- 05_subqueries.sql
-- a) List products whose unit_price is above the average for their supplier.
select product_id,
       name as product_name,
       unit_price
       from products p
     where unit_price > (
           select AVG(unit_price)
           from products
           where supplier_id = p.supplier_id
);

-- b) Find suppliers that currently supply zero products.
select supplier_id,
       name as supplier_name
       from suppliers
     where supplier_id not in (
      select distinct supplier_id
       from products
 );
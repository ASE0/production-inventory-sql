# production-inventory-sql
SQL schema and scripts for a Production & Inventory management system, featuring ERD design, DDL setup, relational integrity, and advanced query examples.

# Scripts
* sql/01_select_basics.sql: Lists all products (product_id, name, unit_price) sorted alphabetically by product name.
* sql/02_filter_runs_and_inventory.sql:
   - Shows production runs from the last 30 days (run_id, product_id, run_date, quantity).
   - Shows inventory records where qty_on_hand is below 10 (inv_id, product_id, location, qty_on_hand, last_updated).
* sql/03_joins.sql:
   - Joins products to suppliers to display each product with its supplier name and unit price.
   - Joins production_runs to products to display run details alongside product name and unit_price.
* sql/04_aggregations.sql:
   - Calculates total units produced per product.
   - Calculates average on-hand inventory per product.

# ERD
The ERD diagram (assets/production_inventory_erd.png) illustrates the relationships between suppliers, products, production_runs, and inventory.

# Getting Started
1. Clone the repository:
   * git clone https://github.com/ASE0/production-inventory-sql.git
     cd production-inventory-sql
2. Create and configure the PostgreSQL database:
   * CREATE DATABASE production_inventory;
     \c production_inventory;
3. Run the DDL script to create tables:
   * psql -U postgres -d production_inventory -f sql/ddl_setup.sql
4. Execute query scripts in the sql/ folder using your SQL client or psql.

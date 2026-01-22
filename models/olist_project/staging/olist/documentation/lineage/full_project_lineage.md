
---

# 🧱 **2. Full Project Lineage — ASCII Diagram (Terminal‑Friendly)**

```text
RAW
 ├── raw_orders
 ├── raw_order_items
 ├── raw_customers
 ├── raw_sellers
 ├── raw_products
 ├── raw_mql
 └── raw_closed_deals
        │
        ▼
STAGING
 ├── stg_orders
 ├── stg_order_items
 ├── stg_customers
 ├── stg_sellers
 ├── stg_products
 ├── stg_mql
 └── stg_closed_deals
        │
        ▼
INTERMEDIATE
 ├── int_orders
 ├── int_order_items
 ├── int_customers
 ├── int_sellers
 ├── int_products
 ├── int_mql
 └── int_closed_deals
        │
        ▼
MARTS
 ├── dim_customers
 ├── dim_sellers
 ├── dim_products
 ├── fact_orders
 ├── fact_order_items
 ├── fact_mqls
 └── fact_closed_deals
        │
        ▼
SALES FUNNEL
 └── sales_funnel

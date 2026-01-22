# 📦 Olist Data Column Lineage
A complete mapping of how raw Olist columns flow through the dbt project:
**RAW → STAGING → INTERMEDIATE → MARTS**

This ensures naming consistency, prevents mismatches, and makes debugging easier.

---

# 🧾 1. Orders Lineage

| Raw Column | Staging (`stg_orders`) | Intermediate (`int_orders`) | Mart (`fact_orders`) |
|-----------|-------------------------|------------------------------|-----------------------|
| order_id | order_id | order_id | order_id |
| customer_id | customer_id | customer_id | customer_id |
| order_status | order_status | order_status | order_status |
| order_purchase_timestamp | order_purchase_ts | order_purchase_ts | order_purchase_ts |
| order_approved_at | order_approved_ts | order_approved_ts | order_approved_ts |
| order_delivered_carrier_date | order_carrier_delivered_ts | order_carrier_delivered_ts | order_carrier_delivered_ts |
| order_delivered_customer_date | order_customer_delivered_ts | order_customer_delivered_ts | order_customer_delivered_ts |
| order_estimated_delivery_date | order_estimated_delivery_ts | order_estimated_delivery_ts | order_estimated_delivery_ts |
| — | — | delivery_days | delivery_days |

---

# 📦 2. Order Items Lineage

| Raw Column | Staging (`stg_order_items`) | Intermediate (`int_order_items`) | Mart (`fact_order_items`) |
|-----------|------------------------------|----------------------------------|----------------------------|
| order_id | order_id | order_id | order_id |
| order_item_id | order_item_id | order_item_id | order_item_id |
| product_id | product_id | product_id | product_id |
| seller_id | seller_id | seller_id | seller_id |
| shipping_limit_date | shipping_limit_ts | shipping_limit_ts | shipping_limit_ts |
| price | price | price | price |
| freight_value | freight_value | freight_value | freight_value |
| — | — | product attributes joined | product attributes |
| — | — | seller attributes joined | seller attributes |

---

# 👤 3. Customers Lineage

| Raw Column | Staging (`stg_customers`) | Intermediate (`int_customers`) | Mart (`dim_customers`) |
|-----------|-----------------------------|--------------------------------|--------------------------|
| customer_id | customer_id | customer_id | customer_id |
| customer_unique_id | customer_unique_id | customer_unique_id | customer_unique_id |
| customer_city | customer_city | customer_city | customer_city |
| customer_state | customer_state | customer_state | customer_state |

---

# 🏪 4. Sellers Lineage

| Raw Column | Staging (`stg_sellers`) | Intermediate (`int_sellers`) | Mart (`dim_sellers`) |
|-----------|---------------------------|-------------------------------|------------------------|
| seller_id | seller_id | seller_id | seller_id |
| seller_city | seller_city | seller_city | seller_city |
| seller_state | seller_state | seller_state | seller_state |

---

# 🛍 5. Products Lineage

| Raw Column | Staging (`stg_products`) | Intermediate | Mart (`dim_products`) |
|-----------|----------------------------|--------------|------------------------|
| product_id | product_id | product_id | product_id |
| product_category_name | product_category_name | product_category_name | product_category_name |
| product_name_lenght | product_name_length | product_name_length | product_name_length |
| product_description_lenght | product_description_length | product_description_length | product_description_length |
| product_photos_qty | product_photos_qty | product_photos_qty | product_photos_qty |
| product_weight_g | product_weight_g | product_weight_g | product_weight_g |
| product_length_cm | product_length_cm | product_length_cm | product_length_cm |
| product_height_cm | product_height_cm | product_height_cm | product_height_cm |
| product_width_cm | product_width_cm | product_width_cm | product_width_cm |

---

# 🔗 6. Funnel Lineage (MQL → Closed Deal → Order → Order Item)

| Stage | Key Columns | Source |
|-------|-------------|--------|
| MQL | mql_id, first_contact_ts, origin | `fact_mqls` |
| Closed Deal | mql_id, seller_id, won_ts | `fact_closed_deals` |
| Order | order_id, customer_id, delivery_days | `fact_orders` |
| Order Item | product_id, price, freight_value | `fact_order_items` |

---

# ✅ Notes
- All timestamp columns follow the `_ts` suffix convention.
- All intermediate models enrich but do not rename staging columns.
- All marts inherit naming from intermediate models.
- This lineage file should be updated whenever staging changes.

---

# 🎯 Purpose
This file ensures:
- consistent naming across layers  
- faster debugging  
- easier onboarding  
- reliable refactoring  
- clean documentation for dbt docs  


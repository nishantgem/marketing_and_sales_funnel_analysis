# 📦 Orders Column Lineage (RAW → STAGING → INTERMEDIATE → MART)

This document tracks how every column in the Olist **orders** dataset flows through the dbt pipeline.  
It ensures naming consistency, prevents mismatches, and makes debugging easier.

---

## 🧾 1. Orders Lineage Table

| Raw Column Name | Staging (`stg_orders`) | Intermediate (`int_orders`) | Mart (`fact_orders`) |
|-----------------|-------------------------|------------------------------|-----------------------|
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

## 🧠 Notes

- All timestamp fields follow the `_ts` suffix convention.
- Staging performs type casting and renaming only.
- Intermediate models enrich data (e.g., `delivery_days`) but do not rename staging columns.
- Mart models inherit naming from intermediate models.
- This lineage should be updated whenever staging column names change.

---

## 🎯 Purpose of This Document

- Maintain consistent
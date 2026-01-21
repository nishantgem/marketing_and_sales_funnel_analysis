# marketing_and_sales_funnel_analysis
Overview
This project analyzes the Brazilian E‑Commerce Public Dataset by Olist to understand the marketing and sales funnel performance from order creation to delivery and review. Python, PostgreSQL, and Tableau are used together to build a reproducible analytics pipeline and interactive dashboards.

Business questions
How efficiently do orders move through the funnel (Created → Approved → Shipped → Delivered → Reviewed)?
​

Where are the biggest drop‑offs and delays, and for which products, customers, and regions?

Which customers, categories, and sellers drive the most revenue and best reviews?

How do delivery performance and payment methods influence satisfaction and repeat behavior?

Tech stack
Python: data loading, cleaning, and transformation (pandas, SQLAlchemy/psycopg2).
​

PostgreSQL (accessed via DBeaver): centralized data warehouse for Olist tables and analytical views.
​

Tableau: dashboards for funnel, customer, product, and delivery performance analysis.

Data sources
Kaggle – Brazilian E‑Commerce Public Dataset by Olist, including:

Orders, order items, payments, reviews

Customers, products, sellers, geolocation

Download the dataset from Kaggle and place the CSVs (or ZIP) in data_raw/.

Repository structure
text
marketing_and_sales_funnel_analysis/
  README.md
  data_raw/              # original Kaggle CSVs
  data_processed/        # cleaned / joined exports for Tableau
  notebooks/             # exploratory analysis (optional)
  src/
    __init__.py
    config.py            # DB connection settings, paths
    extract_load.py      # load CSV -> Postgres
    transform_metrics.py # SQL/Python transforms & metrics
  sql/
    create_tables.sql    # raw table definitions
    transformations.sql  # views/materialized views for funnel, RFM, etc.
  tableau/
    workbook_notes.md    # KPI definitions, dashboard plan
Pipeline
Load raw Olist CSVs from data_raw/ into PostgreSQL using extract_load.py and sql/create_tables.sql.
​

Transform into analytical tables/views (e.g., fact_orders, fact_order_items, RFM, cohorts) using transform_metrics.py and sql/transformations.sql.

Visualize in Tableau by connecting to PostgreSQL and building dashboards for the key business questions above.

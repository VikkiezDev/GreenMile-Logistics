# GreenMile-Logistics
Over the last 3 years (2022–2024), fuel prices spiked dramatically, driver turnover rocked the freight industry, and the operating margins took a hit. GreenMile Logistics has 120 trucks, 150 drivers, and thousands of loads, but the executive team lacks clear visibility into where the business is bleeding cash.

## Executive Problem Statement: The Fleet Profitability & Efficiency Mandate
> "Greenmile Logistics is seeing widening variance in route profitability and fleet efficiency. Identify the core drivers of margin leakage across our route network, evaluate driver and equipment performance, and provide actionable recommendations to optimize our Cost Per Mile (CPM) and On-Time Delivery (OTD) rates."

## Core Business Requirements:
1. Route & Customer Profitability Analysis
    - Goal: Determine which city-pair routes and customer accounts generate high revenue versus those costing us money due to excessive fuel consumption or low rates.
2. Cost Per Mile (CPM) & Fuel Efficiency Breakdown
    - Goal: Dissect our total operating costs across fuel purchases, maintenance expenses, and driver pay to calculate our true operational CPM.
3. Fleet Utilization & Maintenance Risk
    - Goal: Evaluate how efficiently our 120 trucks and 180 trailers are utilized versus time spent sitting idle or in service bays.
4. Driver Performance & Operational Quality Scorecard
    - Goal: Rank driver performance across safety, delivery timeliness, and fuel economy to reward top performers and flag high-risk accounts.

## Repository Structure:
``` plaintext
GreenMile-Logistics/
├── .gitignore
├── README.md
├── docker/
│   └── docker-compose.yml         # Docker database configuration
├── data/
│   ├── dataset/
|   │   ├── green-mile-dataset/    # All the required .csv data files
|   │   ├── DATABASE_SCHEMA.txt    # Complete schema for every table
│   ├── raw/                       # Original CSV/JSON datasets (Git ignored)
│   └── processed/                 # Optional staging exports (Git ignored)
├── src/
│   ├── 01_bronze/                 # Raw data ingestion scripts
│   │   └── 01_load_csv.sql
│   ├── 02_silver/                 # Data cleaning, type casting, deduplication
│   │   ├── 01_clean_orders.sql
│   │   └── 02_clean_customers.sql
│   └── 03_gold/                   # Business logic, aggregations, star schema views
│       ├── dim_customers.sql
│       ├── dim_products.sql
│       └── fact_sales.sql
└── powerbi/
    └── sales_dashboard.pbip      # Power BI project file (or .pbix)
```

## Database Structure:
```
greenmile_db (Database)
│
├── 📁 bronze (Schema) - Raw Tables
│   ├── raw_orders          # Direct copy of raw CSV (all columns text/varchar)
│   └── raw_customers       # Uncleaned source data
│
├── 📁 silver (Schema) - Cleaned Tables / Views
│   ├── stg_orders          # Trimmed strings, fixed dates, NULL handling
│   └── stg_customers       # Deduplicated records, typed values
│
└── 📁 gold (Schema) - Analytics Views (Connected to Power BI)
    ├── dim_customers       # Customer dimension (SCD or unique attributes)
    ├── dim_products        # Product category details
    └── fact_sales          # Transaction facts with foreign keys to dimensions
```

## Data Source & Attribution
The operational dataset used in this project is sourced from the **Synthetic Logistics Operations Database (2022-2024)** created by Yogape Rodriguez.

* **Dataset Author:** Yogape Rodriguez
* **Source:** [Kaggle Dataset](https://www.kaggle.com/datasets/yogape/logistics-operations-database)
* **Citation:** 
  > Rodriguez, Y. (2025). *Synthetic Logistics Operations Database (2022-2024)* [Data set]. Kaggle. https://www.kaggle.com/datasets/yogape/logistics-operations-database
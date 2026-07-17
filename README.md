# 🚗 Automotive Marketing Analytics Platform | Snowflake + dbt + Power BI

> **An end-to-end modern data engineering & analytics project** that simulates a real-world automotive marketplace. This project demonstrates how marketing data from multiple advertising platforms is ingested, transformed, tested, modeled, and visualized using industry-standard tools.

---

## 📌 Project Overview

Marketing teams invest millions across platforms like **Google Ads, Meta Ads, Microsoft Ads, and TikTok Ads**. The challenge is transforming raw advertising data into trusted business insights that executives, marketing managers, and sales teams can use for decision-making.

This project implements a complete analytics pipeline using:

* **Snowflake** as the cloud data warehouse
* **dbt Core** for ELT transformations and data modeling
* **Power BI** for executive dashboards
* **Git & GitHub** for version control
* **Production-ready dbt practices** including tests, snapshots, incremental models, macros, hooks, documentation, and exposures.

---

# 🏗️ Architecture

```text
                   Marketing Platforms
 ┌─────────────────────────────────────────────────────────┐
 │ Google Ads │ Meta Ads │ TikTok Ads │ Microsoft Ads │
 └─────────────────────────────────────────────────────────┘
                         │
                         ▼
                  Snowflake RAW Layer
                         │
                         ▼
                  dbt Staging Models
                         │
                         ▼
               Intermediate Business Layer
                         │
                         ▼
          Dimension & Fact Models (Star Schema)
                         │
                         ▼
              Reporting Models / Semantic Layer
                         │
                         ▼
                   Power BI Dashboards
                         │
                         ▼
              Business Users & Executives
```

---

# 🛠️ Technology Stack

| Category             | Technology   |
| -------------------- | ------------ |
| Cloud Data Warehouse | Snowflake    |
| Data Transformation  | dbt Core     |
| Programming Language | SQL + Jinja  |
| Visualization        | Snowflake Streamlight     |
| Version Control      | Git & GitHub |
| Documentation        | dbt Docs     |
| Package              | dbt_utils    |

---

# 📂 Project Structure

```text
project/
│
├── models/
│   ├── staging/
│   ├── intermediate/
│   ├── marts/
│   │   ├── dimensions/
│   │   ├── facts/
│   │   └── reporting/
│
├── snapshots/
│
├── macros/
│
├── tests/
│
├── seeds/
│
├── analyses/
│
├── snapshots/
│
├── packages.yml
│
├── dbt_project.yml
│
└── README.md
```

---

# 📊 Data Sources

The project simulates a real marketing ecosystem.

### Advertising Platforms

* Google Ads
* Meta Ads
* Microsoft Ads
* TikTok Ads

### Raw Tables

* Ad Accounts
* Campaigns
* Ad Groups
* Ads
* Ad Performance
* Leads
* Conversions

---

# ⭐ Data Warehouse Layers

## RAW

Stores ingested CSV data exactly as received.

Example:

* ad_accounts
* campaigns
* ads
* leads
* conversions

---

## Staging Layer

Purpose:

* Standardize column names
* Data type casting
* Data cleaning
* Deduplication
* Relationship validation

Example Models

* stg_ad_accounts
* stg_campaigns
* stg_ad_groups
* stg_ads
* stg_ad_performance
* stg_leads
* stg_conversions

---

## Intermediate Layer

Business logic and reusable joins.

Example Models

* int_ad_hierarchy
* int_lead_funnel
* int_conversion_details

---

## Mart Layer

### Dimension Models

* dim_accounts
* dim_campaigns
* dim_ad_groups
* dim_ads

### Fact Models

* fct_ad_performance
* fct_leads
* fct_conversions

---

# ⭐ Data Modeling

This project follows a **Star Schema**.

```text
               dim_accounts
                     │
                     │
dim_campaigns ───────┤
                     │
                     ▼
          fct_ad_performance
                     ▲
                     │
              dim_ad_groups
                     │
                     │
                 dim_ads

          fct_leads

          fct_conversions
```

---

# ✅ Data Quality

Implemented production-grade data quality checks.

### Generic Tests

* Not Null
* Unique
* Relationships
* Accepted Values

### Singular Tests

* Duplicate Grain Validation
* Business Rule Validation

### Grain Validation

Examples:

* One row per Campaign
* One row per Lead
* One row per Conversion
* One row per Date + Ad + Country + Device

---

# ⚡ Incremental Models

Implemented incremental loading using:

* `materialized='incremental'`
* Merge Strategy
* Unique Keys
* Look-back Window
* Late-arriving Data Handling

Benefits

* Faster execution
* Reduced warehouse cost
* Production-ready loading strategy

---

# 📸 Snapshots (SCD Type 2)

Historical tracking implemented using dbt Snapshots.

Tracks changes in:

* Campaign Status
* Campaign Budget
* Campaign Metadata

Snapshot Strategy

* Timestamp Strategy
* Updated_at based tracking

---

# 🧩 Macros & Packages

Reusable Jinja macros created for:

* Text standardization
* Safe calculations
* Surrogate Keys

Package Used

* dbt_utils

---

# 🔑 Surrogate Keys

Implemented surrogate keys using:

* `dbt_utils.generate_surrogate_key()`

Used across dimensional models to ensure stable warehouse keys.

---

# 🔄 Source Freshness

Configured freshness monitoring for all raw tables.

Features:

* Warn Threshold
* Error Threshold
* Freshness Validation

---

# 📚 Documentation

Implemented:

* Model Documentation
* Column Documentation
* Lineage Graph
* Exposures

Generated using:

```bash
dbt docs generate
dbt docs serve
```

---

# 🚀 Production Features

✔ Incremental Models

✔ Snapshots

✔ Generic Tests

✔ Singular Tests

✔ Source Freshness

✔ Exposures

✔ Macros

✔ Packages

✔ Surrogate Keys

✔ Hooks

✔ Documentation

✔ Star Schema

---

# 📈 Power BI Dashboards

## Executive Overview

**Business Questions**

* How much did we spend?
* How much revenue did we generate?
* What's the ROAS?
* Which platform performs best?

📸 **Screenshot**

 <img width="1908" height="1000" alt="Screenshot 2026-07-17 160026" src="https://github.com/user-attachments/assets/cef8192d-6b02-46f7-8f96-0d96099df5bf" />
 <img width="1910" height="994" alt="Screenshot 2026-07-17 160123" src="https://github.com/user-attachments/assets/9c8f7733-8c83-4d0a-b979-fd94afd6abb2" />
 <img width="1910" height="1002" alt="Screenshot 2026-07-17 160200" src="https://github.com/user-attachments/assets/47e722e4-1644-464e-8387-0fdf3ab1d517" />





---


---

# 📊 Business KPIs

Implemented KPIs include:

* Total Spend
* Revenue
* ROAS
* CTR
* CPC
* CPM
* Total Leads
* Qualified Leads
* Won Leads
* Conversion Rate
* Refund Rate
* Campaign ROI

---

# 📌 Key Learnings

Throughout this project I implemented:

* Snowflake Data Warehouse Design
* dbt Best Practices
* Modular SQL Development
* Data Modeling
* Star Schema
* Incremental Processing
* Slowly Changing Dimensions
* Data Quality Testing
* Source Freshness
* Production Documentation
* Analytics Engineering Best Practices
* Power BI Dashboard Development

---

# 🎯 Future Enhancements

* Airbyte for automated ingestion
* Apache Airflow orchestration
* CI/CD with GitHub Actions
* Automated monitoring and alerting
* Slack/Email notifications for pipeline failures
* Row-level security in Power BI
* Real API ingestion from Google Ads & GA4

---

# 🙋 About This Project

This repository was built as a **production-style Analytics Engineering portfolio project** to demonstrate practical experience with modern data engineering workflows.

The project emphasizes:

* Clean and maintainable dbt development
* Production-ready Snowflake modeling
* Robust data quality practices
* Business-oriented semantic modeling
* Executive reporting through Power BI

---

# ⭐ If you found this project useful

If this project helped you or inspired your own analytics engineering journey, consider giving it a ⭐ on GitHub.

Happy Learning! 🚀

# Crude Oil Trading Performance & Supply Chain Analysis

**SQL and Power BI portfolio project | MySQL · Power BI · DAX**

This project analyzes 200 crude oil transactions from **January 2023 to August 2024**. It combines transaction, buyer, and supplier data to examine trading quantity, project-calculated revenue, average price, participant contribution, crude-type performance, regional distribution, and monthly trends.

> **Metric note:** “Calculated Revenue” is a project-defined metric calculated as `(quantity_mt × price_per_barrel) / 7.33`. It is not profit, and the analysis does not establish profitability because cost and margin data are not available.

## Contents

- [Business questions](#business-questions)
- [Dataset overview](#dataset-overview)
- [Project structure](#project-structure)
- [Methodology](#methodology)
- [Key results](#key-results)
- [Power BI dashboard](#power-bi-dashboard)
- [Recommendations](#business-recommendations)
- [Tools used](#tools-used)
- [How to review the project](#how-to-review-the-project)
- [Limitations](#limitations)

## Business questions

1. Which buyers and suppliers contribute the most to trading activity in terms of traded quantity and calculated revenue?
2. Which crude oil types have the greatest commercial contribution, and how do their pricing levels differ?
3. Which buyer and supplier regions account for the largest share of trading activity?
4. How does crude oil trading activity change over time, and which periods show notable changes?
5. What is the overall trading performance in terms of transaction count, quantity, average price, and calculated revenue?

## Dataset overview

The project uses three CSV datasets:

| File | Contents |
|---|---|
| `buyers_data.csv` | Buyer/company details, region, and headquarters |
| `suppliers_data.csv` | Supplier/company details, region, and headquarters |
| `transaction_data.csv` | 200 transactions, including buyer/supplier IDs, crude type, quantity, price, and date |

The SQL preparation query joins the transaction, buyer, and supplier tables to create a consolidated, transaction-level source for Power BI. The consolidated output contains **200 rows** and includes buyer and supplier names and regions. The transaction ID is retained in the raw transactions dataset but is not included in the consolidated analytical output because it is not used in the dashboard analysis.

## Project structure

```text
Crude Oil Supply Chain & Sales Management/
├── Case Study.docx
├── Dataset/
│   ├── buyers_data.csv
│   ├── suppliers_data.csv
│   └── transaction_data.csv
├── SQL/
│   ├── 01_PowerBI_Source_Preparation.sql
│   └── 02_Crude_Oil_Supply_Chain_Analysis.sql
├── SQL Output/
│   ├── PowerBI_Source_SQL_Output.csv
│   ├── Q01_Buyer_Supplier_Performance.csv
│   ├── Q02_Crude_Type_Performance.csv
│   ├── Q03_Regional_Performance.csv
│   ├── Q04_Monthly_Trading_Trend.csv
│   └── Q05_Overall_Transaction_Performance.csv
├── Power BI/
│   ├── Crude_Oil_Supply_Chain_Sales_Analysis.pbix
│   └── Crude_Oil_Supply_Chain_Sales_Analysis.pdf
├── Screenshots/
│   ├── Page_1_Executive_Overview.PNG
│   ├── Page_2_Buyer_Supplier_Performance.PNG
│   └── Page_3_Crude_Regional_Trend_Analysis.PNG
├── Documentation/
│   ├── Crude_Oil_Trading_Performance_Supply_Chain_Analysis_Report.docx
│   └── Crude_Oil_Trading_Performance_Supply_Chain_Analysis_Report.pdf
└── README.md
```

## Methodology

1. **Prepare the source in SQL:** join transactions to buyer and supplier details, adding names and regions.
2. **Answer the business questions in SQL:** aggregate transaction count, traded quantity, average price, and calculated revenue for participants, crude types, regions, monthly trends, and overall performance.
3. **Build the Power BI dashboard:** use the consolidated SQL output as the source and present overview KPIs, participant comparisons, regional views, crude-type performance, and trends.
4. **Translate results into business insights:** compare quantity and calculated revenue together, consider price alongside volume, and identify concentration patterns.

### Calculated revenue formula

```sql
SUM((quantity_mt * price_per_barrel) / 7.33)
```

The same project-defined calculation is used for the SQL analysis and Power BI measure.

## Key results

| Metric | Result |
|---|---:|
| Total transactions | 200 |
| Total quantity traded | 15.19M MT |
| Average price | $88.90/bbl |
| Calculated revenue | $186.44M |
| Analysis period | Jan 2023 – Aug 2024 |

### Findings

- **Buyer contribution:** Bharat Petroleum was the largest buyer by traded quantity at approximately **1.71M MT**, with **$20.86M** in calculated revenue. The five highest-contributing buyers accounted for **47.31% of quantity** when ranked by quantity and **47.48% of calculated revenue** when ranked by revenue.
- **Supplier contribution:** Saudi Aramco was the largest supplier by quantity at approximately **1.80M MT**, with **$22.39M** in calculated revenue. The top five suppliers accounted for **47.88% of quantity** and **46.16% of calculated revenue**, ranked separately for each metric.
- **Crude-type performance:** WTI had the highest traded quantity at approximately **3.15M MT**, while Dubai Crude had the highest calculated revenue at approximately **$39.68M**. Dubai Crude's average price was **$93.92/bbl**, compared with **$89.65/bbl** for WTI.
- **Regional contribution:** India was the largest buyer region, with approximately **5.12M MT** and **$61.19M** in calculated revenue. The USA was the largest supplier region by quantity, with approximately **1.92M MT** and **$23.71M** in calculated revenue.
- **Monthly activity:** April 2023 had the highest transaction count (**19**), traded quantity (**1.33M MT**), and calculated revenue (**$17.16M**) in the observed period.
- **Price versus quantity:** June 2024 had the highest monthly average price (**$104.03/bbl**), but traded quantity was approximately **0.33M MT** and calculated revenue was **$4.70M**.

## Power BI dashboard

The dashboard has three pages. Open the `.pbix` file in Power BI Desktop to explore the report interactively.

### Page 1 — Executive Overview

Shows total transactions, traded quantity, calculated revenue, average price, monthly revenue trend, top five buyers by quantity, and crude-type share by quantity.

![Page 1 — Executive Overview](Screenshots/Page_1_Executive_Overview.PNG)

### Page 2 — Buyer & Supplier Performance

Compares buyer and supplier quantity and calculated revenue. Slicers allow analysis by buyer, buyer region, supplier, and supplier region.

![Page 2 — Buyer & Supplier Performance](Screenshots/Page_2_Buyer_Supplier_Performance.PNG)

### Page 3 — Crude, Regional & Trend Analysis

Compares buyer- and supplier-region contribution, monthly quantity alongside average price, and crude-type performance.

![Page 3 — Crude, Regional & Trend Analysis](Screenshots/Page_3_Crude_Regional_Trend_Analysis.PNG)

## Business recommendations

1. **Manage participant concentration:** maintain strong relationships with major contributors while retaining alternative buyers and suppliers.
2. **Evaluate crude types using multiple measures:** review traded quantity, calculated revenue, and average price together rather than relying on quantity alone.
3. **Monitor regional concentration:** review the high share of buyer activity associated with India while maintaining geographic diversity on the supply side.
4. **Track price and quantity together:** a high average price does not necessarily mean high calculated revenue when traded quantity is low.

## Tools used

- **MySQL:** joins, aggregations, and business-question analysis
- **Power BI:** interactive dashboard and visual analysis
- **DAX:** KPI and calculated-revenue measures
- **CSV:** source data and SQL result outputs
- **Word/PDF:** case study and project documentation

## How to review the project

1. Read `Case Study.docx` for the scenario, objectives, business questions, and assumptions.
2. Review the SQL scripts in `SQL/`.
3. Inspect the five analytical result files and the consolidated Power BI source in `SQL Output/`.
4. Open `Power BI/Crude_Oil_Supply_Chain_Sales_Analysis.pbix` in Power BI Desktop, or view the supplied PDF export.
5. Review the three screenshots and the full report in `Documentation/`.

## Limitations

- The analysis covers only the 200 transactions supplied for January 2023 to August 2024.
- The dataset does not include operating or transport costs, procurement costs, profit margins, contract terms, delivery lead times, or supplier-quality measures.
- Calculated revenue is a project-defined metric and should not be described as profit.
- Findings and recommendations are limited to the patterns visible in the available fields and records.

---

**Author:** Agamya Jain  
**Project:** Crude Oil Trading Performance & Supply Chain Analysis

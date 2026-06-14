# End-to-End Global Workforce Layoffs Analytics

End-to-end workforce analytics project leveraging MySQL and Tableau to analyze global layoff trends across companies, industries, countries, and funding stages. The project transforms raw workforce reduction data into executive-level business intelligence through advanced SQL analysis and interactive dashboarding.

---

## Executive Dashboard

<img width="1280" height="769" alt="Screenshot 2026-06-15 at 12 07 10 AM" src="https://github.com/user-attachments/assets/01608b65-c307-4db5-8056-0e9d9837f186" />


### Interactive Dashboard

🔗 **View Dashboard Here:**  
https://public.tableau.com/views/World_Layoffs_tableau_dashboard/Dashboard1

---

## Executive Summary

This project analyzes global workforce reductions to identify the companies, industries, and countries most affected by layoffs and uncover workforce trends across different time periods.

Using MySQL for data cleaning and exploratory analysis and Tableau for visualization, the project delivers actionable business insights into workforce reduction patterns, industry-level risk, geographic impact, and macroeconomic trends.

---

## Key Business Insights

- Technology companies accounted for the largest share of global layoffs.
- The United States recorded the highest workforce reductions globally.
- Workforce reductions accelerated significantly during the 2022–2023 period.
- Several venture-backed startups experienced complete workforce reductions.
- Consumer, retail, and technology sectors were among the most heavily impacted industries.
- A relatively small number of organizations contributed disproportionately to total layoffs worldwide.

---

## Business Problem

Organizations, investors, and analysts require visibility into workforce reduction trends to understand economic shifts, identify industry-level vulnerabilities, and evaluate geographic impact.

This project answers key business questions such as:

- Which companies experienced the highest layoffs?
- Which industries were most affected?
- Which countries recorded the largest workforce reductions?
- How did layoff trends evolve over time?
- What relationship exists between funding levels and workforce reductions?
- Which companies experienced 100% workforce layoffs?

---

## Dataset

The dataset contains global layoff records collected from publicly available sources.

### Features

- Company
- Industry
- Country
- Date
- Total Employees Laid Off
- Percentage Laid Off
- Funding Raised
- Company Stage

**Source:** Kaggle World Layoffs Dataset

---

## Analytics Workflow

### Data Cleaning & Preparation (MySQL)

Performed:

- Duplicate removal using ROW_NUMBER()
- Data standardization
- Missing value treatment
- Date conversion
- Data validation
- Dataset preparation for analysis

### Exploratory Data Analysis

Key questions answered:

- Which companies laid off the most employees?
- Which industries were most affected?
- Which countries experienced the highest layoffs?
- How did layoffs evolve over time?
- Which companies experienced the highest layoffs each year?
- What were the cumulative layoff trends?

### Executive Dashboard Development (Tableau)

Created an interactive dashboard featuring:

- Layoff Trends Over Time
- Most Affected Industries
- Geographic Distribution of Layoffs
- Top Companies by Workforce Reduction
- Funding vs Workforce Reduction Analysis
- Companies with 100% Workforce Reduction

---

## Advanced SQL Techniques Used

- Common Table Expressions (CTEs)
- Window Functions
- ROW_NUMBER()
- DENSE_RANK()
- Aggregate Functions
- Date Functions
- Rolling Calculations
- Cumulative Analysis
- Data Cleaning
- Data Transformation
- Data Validation

---

## Technology Stack

- MySQL
- SQL
- Tableau
- Tableau Public

---

## Repository Structure

world_layoffs_analysis.sql
world_layoffs_dashboard.png
README.md

---

## Business Impact

This project demonstrates how workforce reduction data can be transformed into strategic business intelligence through SQL analytics and dashboarding. The resulting insights help stakeholders identify high-risk industries, monitor workforce trends, evaluate company-level impact, and understand broader economic conditions affecting employment decisions.

---

## Author

Aryan Soni

Data Analyst | SQL | Python | PostgreSQL | Tableau
